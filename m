Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5538F23C5
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Mar 2023 11:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678707502; x=1710243502;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7wB1949SDSrjiqFQxaAkJ8tQ54lDYIrDgQk++V6gz5Q=;
  b=gEf8JppNiRppoJr8W/3eKXrVWDZP0So1IfFzJ4027HMdT6LAdr76WN78
   W2w/6zLJOwcxuhoV8bsQjCCkhtjcPGcbe3bj30EDYkAzJs591/fSHzPp5
   N8r5HiRrDOFIUs9Frv3XX6CB7afJAuaZ92LNDGojzXTCg8vmVW8bR0d+p
   okPBOyxTDOTgeRpqFvAozL1h5ydS5clgBIv71mC4Kiu9kOfqPx8VONU6C
   2zLQQxbx4XVaLPAYrSiaWkrt6/LoqeTBwTQjY3ozSP5WfbP8cc8JwW8Nn
   oAR1y4AE1n1mP40oSfUtHhM1qMaSz2JvQnovreqkYKGBmDBJcnvUl/qAo
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="401993394"
X-IronPort-AV: E=Sophos;i="5.98,256,1673942400"; 
   d="scan'208";a="401993394"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2023 04:38:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="747581148"
X-IronPort-AV: E=Sophos;i="5.98,256,1673942400"; 
   d="scan'208";a="747581148"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 13 Mar 2023 04:38:13 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pbgVI-0005dC-1U;
	Mon, 13 Mar 2023 11:38:12 +0000
Date: Mon, 13 Mar 2023 19:37:34 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Skeggs <bskeggs@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [skeggsb-nouveau:01.03-gsp-ada 58/68]
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/r525.c:287:1: warning: no previous
 prototype for 'r525_fifo_runl_ctor'
Message-ID: <202303131935.cdIBstcd-lkp@intel.com>
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
commit: 09e551038a5b001eb367789a28e56c5bca36af72 [58/68] fifo
config: arm-randconfig-r046-20230313 (https://download.01.org/0day-ci/archive/20230313/202303131935.cdIBstcd-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add skeggsb-nouveau https://gitlab.freedesktop.org/skeggsb/nouveau
        git fetch --no-tags skeggsb-nouveau 01.03-gsp-ada
        git checkout 09e551038a5b001eb367789a28e56c5bca36af72
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/gpu/drm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303131935.cdIBstcd-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/nouveau/nvkm/engine/fifo/r525.c:287:1: warning: no previous prototype for 'r525_fifo_runl_ctor' [-Wmissing-prototypes]
     287 | r525_fifo_runl_ctor(struct nvkm_fifo *fifo)
         | ^~~~~~~~~~~~~~~~~~~


vim +/r525_fifo_runl_ctor +287 drivers/gpu/drm/nouveau/nvkm/engine/fifo/r525.c

   284	
   285	
   286	int
 > 287	r525_fifo_runl_ctor(struct nvkm_fifo *fifo)
   288	{
   289		struct nvkm_subdev *subdev = &fifo->engine.subdev;
   290		struct nvkm_gsp *gsp = subdev->device->gsp;
   291		struct nvkm_runl *runl;
   292		int ret;
   293		NV2080_CTRL_FIFO_GET_DEVICE_INFO_TABLE_PARAMS *ctrl;
   294	
   295		//XXX: chid<->userd + per-RL chid
   296		if ((ret = nvkm_chid_new(&nvkm_chan_event, subdev, 2048, 0, 2048, &fifo->cgid)) ||
   297		    (ret = nvkm_chid_new(&nvkm_chan_event, subdev, 2048, 0, 2048, &fifo->chid)))
   298			return ret;
   299	
   300		ctrl = nvkm_gsp_rm_ctrl_get(gsp, gsp->client, gsp->subdevice,
   301					    NV2080_CTRL_CMD_FIFO_GET_DEVICE_INFO_TABLE, sizeof(*ctrl));
   302		if (WARN_ON(IS_ERR(ctrl)))
   303			return PTR_ERR(ctrl);
   304	
   305		ctrl = nvkm_gsp_rm_ctrl_push(gsp, ctrl, sizeof(*ctrl));
   306		if (WARN_ON(IS_ERR(ctrl)))
   307			return PTR_ERR(ctrl);
   308	
   309		for (int i = 0; i < ctrl->numEntries; i++) {
   310			const u32 addr = ctrl->entries[i].engineData[ENGINE_INFO_TYPE_RUNLIST_PRI_BASE];
   311			const u32 engn = ctrl->entries[i].engineData[ENGINE_INFO_TYPE_RM_ENGINE_TYPE];
   312			const u32 id = ctrl->entries[i].engineData[ENGINE_INFO_TYPE_RUNLIST];
   313			enum nvkm_subdev_type type;
   314			int inst, nv2080;
   315	
   316			runl = nvkm_runl_get(fifo, id, addr);
   317			if (!runl) {
   318				runl = nvkm_runl_new(fifo, id, addr, 0 /*XXX: chid<->userd + per-RL chid*/);
   319				if (WARN_ON(IS_ERR(runl)))
   320					continue;
   321			}
   322	
   323			inst = r525_fifo_engn_type(engn, &type);
   324			if (inst < 0) {
   325				nvkm_warn(subdev, "RM_ENGINE_TYPE 0x%x\n", engn);
   326				continue;
   327			}
   328	
   329			nv2080 = r525_fifo_2080_type(type, inst);
   330			if (nv2080 < 0)
   331				continue;
   332	
   333			if (type == NVKM_ENGINE_CE)
   334				nvkm_runl_add(runl, nv2080, fifo->func->engn_ce, type, inst);
   335			else
   336				nvkm_runl_add(runl, nv2080, fifo->func->engn, type, inst);
   337		}
   338	
   339		nvkm_gsp_rm_ctrl_done(gsp, ctrl);
   340		return 0;
   341	}
   342	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
