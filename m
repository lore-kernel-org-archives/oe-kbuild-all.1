Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF7E23A7
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Mar 2023 09:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678699447; x=1710235447;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5eKna93qlCchLz0TuRcweLqy+k1PfjGuBiQVGMdnOaU=;
  b=T7sNVI79I64kaMDDCzTssIi6h/wZxdwsDw/17dbCytgjr/zmc1Ob6o6b
   LjdkwpA+mIBrkuPFnrkbQJXKFE9egpnkoQAIrdpet7CJ7YiTzQTgp0crl
   uH1I6n+7ooepirIFsU2g0vd8BYaiohpaIC7cNPV58qLr/f1w4acrMc9df
   /k2NIJmeDFjSeATXzWTsC6qm4LT8oM4vJWw0sQqUtoFb/LcJGd/JhgDoD
   w4V5VVCB0+JZuSwKXUywa/yG6IZ7jyFcf7LO/WNs24pTgcmmUS4/g5Eq0
   2wLQ614Id7Rapo9HnXqNihyDlA2uCEyh/1y+8KOCzoqC7QEPc24EPN4FC
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="423367142"
X-IronPort-AV: E=Sophos;i="5.98,256,1673942400"; 
   d="scan'208";a="423367142"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2023 02:24:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="1007916813"
X-IronPort-AV: E=Sophos;i="5.98,256,1673942400"; 
   d="scan'208";a="1007916813"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 13 Mar 2023 02:24:05 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pbePV-0005VR-0B;
	Mon, 13 Mar 2023 09:24:05 +0000
Date: Mon, 13 Mar 2023 17:23:36 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Skeggs <bskeggs@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [skeggsb-nouveau:01.03-gsp-ada 55/68]
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r525.c:644:71: error: passing
 argument 3 of 'dma_alloc_coherent' from incompatible pointer type
Message-ID: <202303131754.uLxeNA0X-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/skeggsb/nouveau 01.03-gsp-ada
head:   89da5e5109a92f4be025e40b80d1f1a6c1d6d8c7
commit: da80f989581a7be4549c3459d0f073c0d6e808fb [55/68] WIPdrm/nouveau/gsp/tu102-: add support for booting GSP-RM
config: csky-randconfig-r031-20230313 (https://download.01.org/0day-ci/archive/20230313/202303131754.uLxeNA0X-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add skeggsb-nouveau https://gitlab.freedesktop.org/skeggsb/nouveau
        git fetch --no-tags skeggsb-nouveau 01.03-gsp-ada
        git checkout da80f989581a7be4549c3459d0f073c0d6e808fb
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=csky olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=csky SHELL=/bin/bash drivers/gpu/drm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303131754.uLxeNA0X-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r525.c: In function 'nvkm_gsp_mem_ctor':
>> drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r525.c:644:71: error: passing argument 3 of 'dma_alloc_coherent' from incompatible pointer type [-Werror=incompatible-pointer-types]
     644 |         mem->data = dma_alloc_coherent(gsp->subdev.device->dev, size, &mem->addr, GFP_KERNEL);
         |                                                                       ^~~~~~~~~~
         |                                                                       |
         |                                                                       u64 * {aka long long unsigned int *}
   In file included from arch/csky/include/asm/pci.h:8,
                    from include/linux/pci.h:1967,
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
   drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r525.c:1119:58: error: passing argument 3 of 'dma_alloc_coherent' from incompatible pointer type [-Werror=incompatible-pointer-types]
    1119 |                                                          &gsp->radix3[i].addr, GFP_KERNEL);
         |                                                          ^~~~~~~~~~~~~~~~~~~~
         |                                                          |
         |                                                          u64 * {aka long long unsigned int *}
   include/linux/dma-mapping.h:421:29: note: expected 'dma_addr_t *' {aka 'unsigned int *'} but argument is of type 'u64 *' {aka 'long long unsigned int *'}
     421 |                 dma_addr_t *dma_handle, gfp_t gfp)
         |                 ~~~~~~~~~~~~^~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/dma_alloc_coherent +644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r525.c

   639	
   640	static int
   641	nvkm_gsp_mem_ctor(struct nvkm_gsp *gsp, u32 size, struct nvkm_gsp_mem *mem)
   642	{
   643		mem->size = size;
 > 644		mem->data = dma_alloc_coherent(gsp->subdev.device->dev, size, &mem->addr, GFP_KERNEL);
   645		if (WARN_ON(!mem->data))
   646			return -ENOMEM;
   647	
   648		return 0;
   649	}
   650	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
