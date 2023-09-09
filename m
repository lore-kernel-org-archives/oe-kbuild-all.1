Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF26D1C07
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Sep 2023 09:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694250722; x=1725786722;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kmpoZIcu0xJS+8SEu6byym/hyoXuBoF9y19u35vivq8=;
  b=eMyzc0SqKn5oOJavvCWg610pmE6/xRgZzyXWxuesPEIFiM5WRPIeKQMk
   LfA81HBTDc7PtKlph8XlSYMG9L6QMq/XZI1MKOUNe6kvavadg0ure1voj
   fBTCYFfiNYWVQRzYuITg2NQqkWqXoi7F4OkLcs2D1JiRePVbfrutDeWXW
   Ei8QVZqZ787MpZSgKsYtCQK4DxW8PgYNZ6HK5Hr/luaphRGFT/22Bdq3S
   vI+xD5nZuOlet2QvYla0Lai0JFMZgOC5DEH/Bvct5L21R/rgJJZ8ppiqP
   Z8MOjOhc7RoPE8CnwiapDhAHnoA52tEtl9PqHWltHbZpQOULtZKh19qdY
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="358112884"
X-IronPort-AV: E=Sophos;i="6.02,239,1688454000"; 
   d="scan'208";a="358112884"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2023 02:12:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="989524968"
X-IronPort-AV: E=Sophos;i="6.02,239,1688454000"; 
   d="scan'208";a="989524968"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 09 Sep 2023 02:12:00 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qeu0U-0003CU-2g;
	Sat, 09 Sep 2023 09:11:58 +0000
Date: Sat, 9 Sep 2023 17:11:33 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Skeggs <bskeggs@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [skeggsb-nouveau:00.02-gsp-rm 81/88]
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.c:303:1: warning: no previous
 prototype for 'r535_fifo_runl_ctor'
Message-ID: <202309091701.xzsKF8c7-lkp@intel.com>
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
commit: 7de06e53ab58182c4b24ac4e35ff28ed5ba26d13 [81/88] WIPdrm/nouveau/fifo/r535: initial support
config: arm-defconfig (https://download.01.org/0day-ci/archive/20230909/202309091701.xzsKF8c7-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230909/202309091701.xzsKF8c7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309091701.xzsKF8c7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.c:303:1: warning: no previous prototype for 'r535_fifo_runl_ctor' [-Wmissing-prototypes]
     303 | r535_fifo_runl_ctor(struct nvkm_fifo *fifo)
         | ^~~~~~~~~~~~~~~~~~~


vim +/r535_fifo_runl_ctor +303 drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.c

   300	
   301	
   302	int
 > 303	r535_fifo_runl_ctor(struct nvkm_fifo *fifo)
   304	{
   305		struct nvkm_subdev *subdev = &fifo->engine.subdev;
   306		struct nvkm_gsp *gsp = subdev->device->gsp;
   307		struct nvkm_runl *runl;
   308		struct nvkm_engn *engn;
   309		int ret;
   310		NV2080_CTRL_FIFO_GET_DEVICE_INFO_TABLE_PARAMS *ctrl;
   311	
   312		//XXX: chid<->userd + per-RL chid
   313		if ((ret = nvkm_chid_new(&nvkm_chan_event, subdev, 2048, 0, 2048, &fifo->cgid)) ||
   314		    (ret = nvkm_chid_new(&nvkm_chan_event, subdev, 2048, 0, 2048, &fifo->chid)))
   315			return ret;
   316	
   317		ctrl = nvkm_gsp_rm_ctrl_rd(&gsp->internal.device.subdevice,
   318					   NV2080_CTRL_CMD_FIFO_GET_DEVICE_INFO_TABLE, sizeof(*ctrl));
   319		if (WARN_ON(IS_ERR(ctrl)))
   320			return PTR_ERR(ctrl);
   321	
   322		for (int i = 0; i < ctrl->numEntries; i++) {
   323			const u32 addr = ctrl->entries[i].engineData[ENGINE_INFO_TYPE_RUNLIST_PRI_BASE];
   324			const u32 id = ctrl->entries[i].engineData[ENGINE_INFO_TYPE_RUNLIST];
   325	
   326			runl = nvkm_runl_get(fifo, id, addr);
   327			if (!runl) {
   328				runl = nvkm_runl_new(fifo, id, addr, 0 /*XXX: chid<->userd + per-RL chid*/);
   329				if (WARN_ON(IS_ERR(runl)))
   330					continue;
   331			}
   332		}
   333	
   334		for (int i = 0; i < ctrl->numEntries; i++) {
   335			const u32 addr = ctrl->entries[i].engineData[ENGINE_INFO_TYPE_RUNLIST_PRI_BASE];
   336			const u32 rmid = ctrl->entries[i].engineData[ENGINE_INFO_TYPE_RM_ENGINE_TYPE];
   337			const u32 id = ctrl->entries[i].engineData[ENGINE_INFO_TYPE_RUNLIST];
   338			enum nvkm_subdev_type type;
   339			int inst, nv2080;
   340	
   341			runl = nvkm_runl_get(fifo, id, addr);
   342			if (!runl)
   343				continue;
   344	
   345			inst = r535_fifo_engn_type(rmid, &type);
   346			if (inst < 0) {
   347				nvkm_warn(subdev, "RM_ENGINE_TYPE 0x%x\n", rmid);
   348				nvkm_runl_del(runl);
   349				continue;
   350			}
   351	
   352			nv2080 = r535_fifo_2080_type(type, inst);
   353			if (nv2080 < 0) {
   354				nvkm_runl_del(runl);
   355				continue;
   356			}
   357	
   358			switch (type) {
   359			case NVKM_ENGINE_CE:
   360			case NVKM_ENGINE_GR:
   361				engn = nvkm_runl_add(runl, nv2080, &r535_engn, type, inst);
   362				break;
   363			case NVKM_ENGINE_SW:
   364				continue;
   365			default:
   366				engn = NULL;
   367				break;
   368			}
   369	
   370			if (!engn) {
   371				nvkm_runl_del(runl);
   372				continue;
   373			}
   374		}
   375	
   376		nvkm_gsp_rm_ctrl_done(&gsp->internal.device.subdevice, ctrl);
   377		return 0;
   378	}
   379	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
