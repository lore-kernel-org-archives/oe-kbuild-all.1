Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DBEF1FA4
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Jul 2023 06:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689919520; x=1721455520;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bSQb2bnNAqJqjjj2kqnW0Y/ASnTmmRJfsYV2sawQQJU=;
  b=i6wzespFXuK9+2XKi2kyDnE0PEaeTHUkFT1OLchf0IHCQ0vSYhAAYaf0
   He6OQ5wDMlpzQAlEsvAFKEzTYOARsAwQDzBzbNy1QnI3XqLWHvWUi5hpO
   xkNyh73vZi/t4qdEnIYA8hOgRygyEKaolp7qDcQEdCJAxsNJM/yi0SxMW
   WYDV4383iE2emb1RquJMRzcQPxzd9cVwZkM7ylgCoHCeJIiKQMj12C4Go
   TDyLZzvvwfMQhPBgQ9VsjulTCcib6KA8vaoLxaILxRuGxg2nm++XPNA8H
   UhE7hdgpqtrE3pz4J5ulLTtEGbregDu0eI+6q5ln9jO1LecAiMMNW8MmA
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="370546772"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; 
   d="scan'208";a="370546772"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2023 23:05:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="838430032"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; 
   d="scan'208";a="838430032"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 20 Jul 2023 23:05:18 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qMjGP-0006wR-1v;
	Fri, 21 Jul 2023 06:05:17 +0000
Date: Fri, 21 Jul 2023 14:05:00 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Skeggs <bskeggs@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [skeggsb-nouveau:00.02-gsp-rm 70/83]
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:678:71: error: passing
 argument 3 of 'dma_alloc_coherent' from incompatible pointer type
Message-ID: <202307211323.Uk93Fo3P-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/skeggsb/nouveau 00.02-gsp-rm
head:   19545cf2c6adc9e9dc95a3edb138d6734142a8ca
commit: 02f0bbcb4d7d0867a087b60a69f6c6250c2a65a6 [70/83] WIPdrm/nouveau/gsp/r535: add support for booting GSP-RM
config: parisc-defconfig (https://download.01.org/0day-ci/archive/20230721/202307211323.Uk93Fo3P-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230721/202307211323.Uk93Fo3P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307211323.Uk93Fo3P-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c: In function 'nvkm_gsp_mem_ctor':
>> drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:678:71: error: passing argument 3 of 'dma_alloc_coherent' from incompatible pointer type [-Werror=incompatible-pointer-types]
     678 |         mem->data = dma_alloc_coherent(gsp->subdev.device->dev, size, &mem->addr, GFP_KERNEL);
         |                                                                       ^~~~~~~~~~
         |                                                                       |
         |                                                                       u64 * {aka long long unsigned int *}
   In file included from include/linux/pci.h:2592,
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
