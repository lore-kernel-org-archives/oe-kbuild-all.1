Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C42AD17C5
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Sep 2023 05:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694237507; x=1725773507;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=At84pEMYIT0DxuIhF0eYBdrCnJrgj4pabXxfA2hi3jc=;
  b=mnR21d3jEXE+wjTtBEfUzLXG5wlrypdFyQLKKjiYddIXBe2fWuAO34Tn
   bidUTChnOkXrvoRz25h/Pr6DDRo0n+A9asTCLsyaM+AqI8aiFHICpHX8d
   flkboCSvYicyaqd5ImKna7CcAThqcCFM4BDZhzn0kFncJX61jvMlSmGPI
   jiWWllWL6/YuS8gvtg3YMYjT/ZAn6IPVPbavsFYbzAPJ+k/xxVKOu/MGQ
   sfPHgxtBjXC+rYM13LwrKQzpPe4AuL1CJ9DUbLext3o17Y13y57IzFdwD
   mbwBgH29aj4YVNPNCYDe2q/aK9Q3DD9kPCKBKMNq2Prf7p5TmYcBQL7xr
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="377705648"
X-IronPort-AV: E=Sophos;i="6.02,239,1688454000"; 
   d="scan'208";a="377705648"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2023 22:31:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="736179493"
X-IronPort-AV: E=Sophos;i="6.02,239,1688454000"; 
   d="scan'208";a="736179493"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 08 Sep 2023 22:31:45 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qeqZL-0002xH-0f;
	Sat, 09 Sep 2023 05:31:43 +0000
Date: Sat, 9 Sep 2023 13:30:57 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Skeggs <bskeggs@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [skeggsb-nouveau:00.02-gsp-rm 75/88]
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:862:71: error: passing
 argument 3 of 'dma_alloc_coherent' from incompatible pointer type
Message-ID: <202309091357.9fDtEQgc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/skeggsb/nouveau 00.02-gsp-rm
head:   dcd62291d3f1ba328303b1617495fa4542117fc1
commit: be0fbb4280f503fc23755c670bb9279fea89e46a [75/88] WIPdrm/nouveau/gsp/r535: add support for booting GSP-RM
config: arm-defconfig (https://download.01.org/0day-ci/archive/20230909/202309091357.9fDtEQgc-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230909/202309091357.9fDtEQgc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309091357.9fDtEQgc-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/gpu/drm/nouveau/nvkm/subdev/gsp/fwsec.c:172:1: warning: no previous prototype for 'nvkm_gsp_fwsec_v2' [-Wmissing-prototypes]
     172 | nvkm_gsp_fwsec_v2(struct nvkm_gsp *gsp, const char *name,
         | ^~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/nouveau/nvkm/subdev/gsp/fwsec.c:222:1: warning: no previous prototype for 'nvkm_gsp_fwsec_v3' [-Wmissing-prototypes]
     222 | nvkm_gsp_fwsec_v3(struct nvkm_gsp *gsp, const char *name,
         | ^~~~~~~~~~~~~~~~~
--
   drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c: In function 'tu102_gsp_booter_ctor':
>> drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c:39:29: warning: variable 'meta' set but not used [-Wunused-but-set-variable]
      39 |         u32 loc, sig, cnt, *meta;
         |                             ^~~~
--
   drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c: In function 'nvkm_gsp_mem_ctor':
>> drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:862:71: error: passing argument 3 of 'dma_alloc_coherent' from incompatible pointer type [-Werror=incompatible-pointer-types]
     862 |         mem->data = dma_alloc_coherent(gsp->subdev.device->dev, size, &mem->addr, GFP_KERNEL);
         |                                                                       ^~~~~~~~~~
         |                                                                       |
         |                                                                       u64 * {aka long long unsigned int *}
   In file included from include/linux/pci.h:2593,
                    from drivers/gpu/drm/nouveau/include/nvif/os.h:8,
                    from drivers/gpu/drm/nouveau/include/nvkm/core/os.h:4,
                    from drivers/gpu/drm/nouveau/include/nvkm/core/oclass.h:3,
                    from drivers/gpu/drm/nouveau/include/nvkm/core/device.h:4,
                    from drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h:4,
                    from drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h:4,
                    from drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h:4,
                    from drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:22:
   include/linux/dma-mapping.h:422:29: note: expected 'dma_addr_t *' {aka 'unsigned int *'} but argument is of type 'u64 *' {aka 'long long unsigned int *'}
     422 |                 dma_addr_t *dma_handle, gfp_t gfp)
         |                 ~~~~~~~~~~~~^~~~~~~~~~
   drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c: In function 'nvkm_gsp_radix3_sg':
   drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:1191:55: error: passing argument 3 of 'dma_alloc_coherent' from incompatible pointer type [-Werror=incompatible-pointer-types]
    1191 |                                                       &rx3->mem[i].addr, GFP_KERNEL);
         |                                                       ^~~~~~~~~~~~~~~~~
         |                                                       |
         |                                                       u64 * {aka long long unsigned int *}
   include/linux/dma-mapping.h:422:29: note: expected 'dma_addr_t *' {aka 'unsigned int *'} but argument is of type 'u64 *' {aka 'long long unsigned int *'}
     422 |                 dma_addr_t *dma_handle, gfp_t gfp)
         |                 ~~~~~~~~~~~~^~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/dma_alloc_coherent +862 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c

   857	
   858	static int
   859	nvkm_gsp_mem_ctor(struct nvkm_gsp *gsp, u32 size, struct nvkm_gsp_mem *mem)
   860	{
   861		mem->size = size;
 > 862		mem->data = dma_alloc_coherent(gsp->subdev.device->dev, size, &mem->addr, GFP_KERNEL);
   863		if (WARN_ON(!mem->data))
   864			return -ENOMEM;
   865	
   866		return 0;
   867	}
   868	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
