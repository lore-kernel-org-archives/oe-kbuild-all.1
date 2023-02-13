Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C01FA33D1
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Feb 2023 13:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676296640; x=1707832640;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=viEFBMCydZ819eRqkOgiF0TCXH7kBcoJGUAWREwhCmA=;
  b=d8THwXZGkBZMkeezBf3G+Oq0LOlCBJFmerMKS2pl+L+99kQOrq+9a4po
   k1PcHTKpZ6AgXSaTLPLs9c1kxoOk+nS/7K8XCiIXDoGCf3pSvKcutYyNh
   /P1zaReixY2QYMYyRlsav0p68AWXInmVmPvxNudTw8awP7YAY0sFiM1U+
   GXgQ8KDOB0aKd6g2uWZzpRGBn++ZAB7sAlh/a6824HkEFbM49ACN1Pvhf
   zn8C0fp0f6pIK8/k7j2Wum0txW1NkhnBOhjsmsOVOliECRk/at+kagHOs
   gAz6Ym79/R8BUsgruuA9mBlTVXuDCjepg/TIxlozxsAo5mRIq5dKCUqEw
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="395502366"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; 
   d="scan'208";a="395502366"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2023 05:57:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="699178206"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; 
   d="scan'208";a="699178206"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 13 Feb 2023 05:57:19 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pRZKY-0007ld-1c;
	Mon, 13 Feb 2023 13:57:18 +0000
Date: Mon, 13 Feb 2023 21:57:15 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Skeggs <bskeggs@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [skeggsb-nouveau:01.03-gsp-ada 190/193]
 drivers/gpu/drm/nouveau/nvkm/engine/gr/r525.c:194:22: warning: variable
 'nonmapped' set but not used
Message-ID: <202302132153.OUTjEjP1-lkp@intel.com>
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
commit: e720f5f259fd961cc62a999800a8d96129849916 [190/193] gr
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230213/202302132153.OUTjEjP1-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add skeggsb-nouveau https://gitlab.freedesktop.org/skeggsb/nouveau
        git fetch --no-tags skeggsb-nouveau 01.03-gsp-ada
        git checkout e720f5f259fd961cc62a999800a8d96129849916
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/gpu/drm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302132153.OUTjEjP1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/nouveau/nvkm/engine/gr/r525.c: In function 'r525_gr_oneinit_ctx':
>> drivers/gpu/drm/nouveau/nvkm/engine/gr/r525.c:194:22: warning: variable 'nonmapped' set but not used [-Wunused-but-set-variable]
     194 |                 bool nonmapped = false;
         |                      ^~~~~~~~~


vim +/nonmapped +194 drivers/gpu/drm/nouveau/nvkm/engine/gr/r525.c

   174	
   175	static int
   176	r525_gr_oneinit_ctx(struct r525_gr *gr)
   177	{
   178		NV2080_CTRL_INTERNAL_STATIC_GR_GET_CONTEXT_BUFFERS_INFO_PARAMS *info;
   179		struct nvkm_device *device = gr->base.engine.subdev.device;
   180		struct nvkm_gsp *gsp = device->gsp;
   181		int ret;
   182	
   183		info = nvkm_gsp_rm_ctrl_rd(gsp, gsp->client, gsp->subdevice,
   184					   NV2080_CTRL_CMD_INTERNAL_STATIC_KGR_GET_CONTEXT_BUFFERS_INFO,
   185					   sizeof(*info));
   186		if (WARN_ON(IS_ERR(info)))
   187			return PTR_ERR(info);
   188	
   189		for (int i = 0; i < ARRAY_SIZE(info->engineContextBuffersInfo[0].engine); i++) {
   190			u32 size = info->engineContextBuffersInfo[0].engine[i].size;
   191			u32 align = info->engineContextBuffersInfo[0].engine[i].alignment;
   192			bool global = true;
   193			bool init = false;
 > 194			bool nonmapped = false;
   195			bool priv = true;
   196			bool ro = false;
   197			int id;
   198	
   199			switch (i) {
   200			case NV0080_CTRL_FIFO_GET_ENGINE_CONTEXT_PROPERTIES_ENGINE_ID_GRAPHICS:
   201				id = NV2080_CTRL_GPU_PROMOTE_CTX_BUFFER_ID_MAIN;
   202				size = ALIGN(size, 0x1000) + 64 * 0x1000; /* per-subctx headers */
   203				global = false;
   204				init = true;
   205				break;
   206			case NV0080_CTRL_FIFO_GET_ENGINE_CONTEXT_PROPERTIES_ENGINE_ID_GRAPHICS_PATCH:
   207				id = NV2080_CTRL_GPU_PROMOTE_CTX_BUFFER_ID_PATCH;
   208				global = false;
   209				init = true;
   210				priv = false;
   211				break;
   212			case NV0080_CTRL_FIFO_GET_ENGINE_CONTEXT_PROPERTIES_ENGINE_ID_GRAPHICS_BUNDLE_CB:
   213				id = NV2080_CTRL_GPU_PROMOTE_CTX_BUFFER_ID_BUFFER_BUNDLE_CB;
   214				break;
   215			case NV0080_CTRL_FIFO_GET_ENGINE_CONTEXT_PROPERTIES_ENGINE_ID_GRAPHICS_PAGEPOOL:
   216				id = NV2080_CTRL_GPU_PROMOTE_CTX_BUFFER_ID_PAGEPOOL;
   217				break;
   218			case NV0080_CTRL_FIFO_GET_ENGINE_CONTEXT_PROPERTIES_ENGINE_ID_GRAPHICS_ATTRIBUTE_CB:
   219				id = NV2080_CTRL_GPU_PROMOTE_CTX_BUFFER_ID_ATTRIBUTE_CB;
   220				break;
   221			case NV0080_CTRL_FIFO_GET_ENGINE_CONTEXT_PROPERTIES_ENGINE_ID_GRAPHICS_RTV_CB_GLOBAL:
   222				id = NV2080_CTRL_GPU_PROMOTE_CTX_BUFFER_ID_RTV_CB_GLOBAL;
   223				break;
   224			case NV0080_CTRL_FIFO_GET_ENGINE_CONTEXT_PROPERTIES_ENGINE_ID_GRAPHICS_FECS_EVENT:
   225				id = NV2080_CTRL_GPU_PROMOTE_CTX_BUFFER_ID_FECS_EVENT;
   226				init = true;
   227				break;
   228			case NV0080_CTRL_FIFO_GET_ENGINE_CONTEXT_PROPERTIES_ENGINE_ID_GRAPHICS_PRIV_ACCESS_MAP:
   229				id = NV2080_CTRL_GPU_PROMOTE_CTX_BUFFER_ID_PRIV_ACCESS_MAP;
   230				nonmapped = true; // for just this one
   231				id = NV2080_CTRL_GPU_PROMOTE_CTX_BUFFER_ID_UNRESTRICTED_PRIV_ACCESS_MAP;
   232				init = true; // for both
   233				priv = false; // for both
   234				ro = true; // for just this one
   235				break;
   236			default:
   237				continue;
   238			}
   239	
   240			if (WARN_ON(gr->ctxbuf_nr == ARRAY_SIZE(gr->ctxbuf)))
   241				continue;
   242	
   243			gr->ctxbuf[gr->ctxbuf_nr].global = global;
   244			gr->ctxbuf[gr->ctxbuf_nr].size = size;
   245			gr->ctxbuf[gr->ctxbuf_nr].align = align;
   246			gr->ctxbuf[gr->ctxbuf_nr].bufferId = id;
   247			gr->ctxbuf[gr->ctxbuf_nr].init = init;
   248			gr->ctxbuf[gr->ctxbuf_nr].priv = priv;
   249			gr->ctxbuf[gr->ctxbuf_nr].ro = ro;
   250	
   251			if (global) {
   252				ret = nvkm_memory_new(device, NVKM_MEM_TARGET_INST,
   253						      gr->ctxbuf[gr->ctxbuf_nr].size,
   254						      gr->ctxbuf[gr->ctxbuf_nr].align,
   255						      true, &gr->ctxbuf[gr->ctxbuf_nr].mem);
   256				if (ret)
   257					return ret;
   258			}
   259	
   260			gr->ctxbuf_nr++;
   261		}
   262	
   263		nvkm_gsp_rm_ctrl_done(gsp, info);
   264		return 0;
   265	}
   266	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
