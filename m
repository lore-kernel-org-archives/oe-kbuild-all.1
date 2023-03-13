Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5712569
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Mar 2023 13:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678712418; x=1710248418;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ow83dKxwGlfQWPN2mDvD3g0V2FtJ/qAxWjQIeTE4uTk=;
  b=Y0MJLysUVGsbaxqnlRJGoEc0EjiU84I9OGGr8wQb8aU/P512NoBv5unc
   QPJOJGbZKKiMqc93ph7/CkGYieMXtgU6o8wQEiX0yBGdj1bXZ6nnQTbbZ
   1Hd0Q2OxeTo3BmpAjQzx7NtkU784bgXlXa8Cww3SOutcf3p5vKPt90W2S
   xz47Eu7ROKa9Ia1YAKuHfZj820e9FcQD1RnaD17avJ+2ygdCamLDObC6S
   zyeEWyWGdmuNRynOhqFfi1VOPfJMFcc7vM1H9vuMVR+o3V9EdBAn1c2FJ
   KANfCuEWwX7ooOZNetU60TUNcqkZVbW5LpDs7WZbL11SyUn/qbjjXyMQs
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="423403092"
X-IronPort-AV: E=Sophos;i="5.98,257,1673942400"; 
   d="scan'208";a="423403092"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2023 06:00:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="628620830"
X-IronPort-AV: E=Sophos;i="5.98,257,1673942400"; 
   d="scan'208";a="628620830"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 13 Mar 2023 06:00:16 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pbhmi-0005g2-0F;
	Mon, 13 Mar 2023 13:00:16 +0000
Date: Mon, 13 Mar 2023 20:59:50 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Skeggs <bskeggs@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [skeggsb-nouveau:01.03-gsp-ada 61/68]
 drivers/gpu/drm/nouveau/nvkm/engine/gr/r525.c:232:22: warning: variable
 'nonmapped' set but not used
Message-ID: <202303132029.PumEhCqt-lkp@intel.com>
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
commit: dd4f302a8aa6f5cf904fc48fecef3b0ec47ea317 [61/68] gr
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20230313/202303132029.PumEhCqt-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add skeggsb-nouveau https://gitlab.freedesktop.org/skeggsb/nouveau
        git fetch --no-tags skeggsb-nouveau 01.03-gsp-ada
        git checkout dd4f302a8aa6f5cf904fc48fecef3b0ec47ea317
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/gpu/drm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303132029.PumEhCqt-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/nouveau/nvkm/engine/gr/r525.c: In function 'r525_gr_oneinit_ctx':
>> drivers/gpu/drm/nouveau/nvkm/engine/gr/r525.c:232:22: warning: variable 'nonmapped' set but not used [-Wunused-but-set-variable]
     232 |                 bool nonmapped = false;
         |                      ^~~~~~~~~


vim +/nonmapped +232 drivers/gpu/drm/nouveau/nvkm/engine/gr/r525.c

   212	
   213	static int
   214	r525_gr_oneinit_ctx(struct r525_gr *gr)
   215	{
   216		NV2080_CTRL_INTERNAL_STATIC_GR_GET_CONTEXT_BUFFERS_INFO_PARAMS *info;
   217		struct nvkm_device *device = gr->base.engine.subdev.device;
   218		struct nvkm_gsp *gsp = device->gsp;
   219		int ret;
   220	
   221		info = nvkm_gsp_rm_ctrl_rd(gsp, gsp->client, gsp->subdevice,
   222					   NV2080_CTRL_CMD_INTERNAL_STATIC_KGR_GET_CONTEXT_BUFFERS_INFO,
   223					   sizeof(*info));
   224		if (WARN_ON(IS_ERR(info)))
   225			return PTR_ERR(info);
   226	
   227		for (int i = 0; i < ARRAY_SIZE(info->engineContextBuffersInfo[0].engine); i++) {
   228			u32 size = info->engineContextBuffersInfo[0].engine[i].size;
   229			u32 align = info->engineContextBuffersInfo[0].engine[i].alignment;
   230			bool global = true;
   231			bool init = false;
 > 232			bool nonmapped = false;
   233			bool priv = true;
   234			bool ro = false;
   235			int id;
   236	
   237			switch (i) {
   238			case NV0080_CTRL_FIFO_GET_ENGINE_CONTEXT_PROPERTIES_ENGINE_ID_GRAPHICS:
   239				id = NV2080_CTRL_GPU_PROMOTE_CTX_BUFFER_ID_MAIN;
   240				size = ALIGN(size, 0x1000) + 64 * 0x1000; /* per-subctx headers */
   241				global = false;
   242				init = true;
   243				break;
   244			case NV0080_CTRL_FIFO_GET_ENGINE_CONTEXT_PROPERTIES_ENGINE_ID_GRAPHICS_PATCH:
   245				id = NV2080_CTRL_GPU_PROMOTE_CTX_BUFFER_ID_PATCH;
   246				global = false;
   247				init = true;
   248				priv = false;
   249				break;
   250			case NV0080_CTRL_FIFO_GET_ENGINE_CONTEXT_PROPERTIES_ENGINE_ID_GRAPHICS_BUNDLE_CB:
   251				id = NV2080_CTRL_GPU_PROMOTE_CTX_BUFFER_ID_BUFFER_BUNDLE_CB;
   252				break;
   253			case NV0080_CTRL_FIFO_GET_ENGINE_CONTEXT_PROPERTIES_ENGINE_ID_GRAPHICS_PAGEPOOL:
   254				id = NV2080_CTRL_GPU_PROMOTE_CTX_BUFFER_ID_PAGEPOOL;
   255				break;
   256			case NV0080_CTRL_FIFO_GET_ENGINE_CONTEXT_PROPERTIES_ENGINE_ID_GRAPHICS_ATTRIBUTE_CB:
   257				id = NV2080_CTRL_GPU_PROMOTE_CTX_BUFFER_ID_ATTRIBUTE_CB;
   258				break;
   259			case NV0080_CTRL_FIFO_GET_ENGINE_CONTEXT_PROPERTIES_ENGINE_ID_GRAPHICS_RTV_CB_GLOBAL:
   260				id = NV2080_CTRL_GPU_PROMOTE_CTX_BUFFER_ID_RTV_CB_GLOBAL;
   261				break;
   262			case NV0080_CTRL_FIFO_GET_ENGINE_CONTEXT_PROPERTIES_ENGINE_ID_GRAPHICS_FECS_EVENT:
   263				id = NV2080_CTRL_GPU_PROMOTE_CTX_BUFFER_ID_FECS_EVENT;
   264				init = true;
   265				break;
   266			case NV0080_CTRL_FIFO_GET_ENGINE_CONTEXT_PROPERTIES_ENGINE_ID_GRAPHICS_PRIV_ACCESS_MAP:
   267				id = NV2080_CTRL_GPU_PROMOTE_CTX_BUFFER_ID_PRIV_ACCESS_MAP;
   268				nonmapped = true; // for just this one
   269				id = NV2080_CTRL_GPU_PROMOTE_CTX_BUFFER_ID_UNRESTRICTED_PRIV_ACCESS_MAP;
   270				init = true; // for both
   271				priv = false; // for both
   272				ro = true; // for just this one
   273				break;
   274			default:
   275				continue;
   276			}
   277	
   278			if (WARN_ON(gr->ctxbuf_nr == ARRAY_SIZE(gr->ctxbuf)))
   279				continue;
   280	
   281			gr->ctxbuf[gr->ctxbuf_nr].global = global;
   282			gr->ctxbuf[gr->ctxbuf_nr].size = size;
   283			gr->ctxbuf[gr->ctxbuf_nr].align = align;
   284			gr->ctxbuf[gr->ctxbuf_nr].bufferId = id;
   285			gr->ctxbuf[gr->ctxbuf_nr].init = init;
   286			gr->ctxbuf[gr->ctxbuf_nr].priv = priv;
   287			gr->ctxbuf[gr->ctxbuf_nr].ro = ro;
   288	
   289			if (global) {
   290				ret = nvkm_memory_new(device, NVKM_MEM_TARGET_INST,
   291						      gr->ctxbuf[gr->ctxbuf_nr].size,
   292						      gr->ctxbuf[gr->ctxbuf_nr].align,
   293						      true, &gr->ctxbuf[gr->ctxbuf_nr].mem);
   294				if (ret)
   295					return ret;
   296			}
   297	
   298			gr->ctxbuf_nr++;
   299		}
   300	
   301		nvkm_gsp_rm_ctrl_done(gsp, info);
   302		return 0;
   303	}
   304	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
