Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0DB320F8E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Jul 2023 19:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689188834; x=1720724834;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gcjGDruZyGTfGpkQ1MCiKB8h8VZ9OZfoMgLL4lJXHp8=;
  b=HY/mpHiNTPmIL0mWkOoNeae27a/jIejtqEcl1N3y5UE/4M0yrANUfJlu
   B1CsJBGb7FhL91PaSU/9YXiokrwjMWgpAk97QgSxrT+hT4Mnt/SXB4eiA
   FM3jylzSufKEsDQ+V2Dpf68VbWAHvFtBSMBB876CQsz8Ux4CLCs+uea0k
   0tbeZvLtsrE0x/zMCSldWn99cMy+/HFDKj4qNJ3BC6duSnPZgRIkHWcTD
   cZUIkZtXB7EdJRMUQruvkrpnKSYJz5LPwZEyQTflEMpxj/qGuBTTNpYXE
   SXcDy9iMmdTc82+RXEixzlV5hwDKKMsE8i1+YUOfWEnZ8Yss/Qt8S6M8W
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="344578365"
X-IronPort-AV: E=Sophos;i="6.01,200,1684825200"; 
   d="scan'208";a="344578365"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2023 12:07:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="671973962"
X-IronPort-AV: E=Sophos;i="6.01,200,1684825200"; 
   d="scan'208";a="671973962"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 12 Jul 2023 12:07:05 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJfB2-0005w1-2M;
	Wed, 12 Jul 2023 19:07:04 +0000
Date: Thu, 13 Jul 2023 03:06:48 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Skeggs <bskeggs@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [skeggsb-nouveau:00.02-gsp-rm 76/83]
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.c:303:1: warning: no previous
 prototype for 'r535_fifo_runl_ctor'
Message-ID: <202307130314.2OySgGXY-lkp@intel.com>
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
commit: bb6ac47f73075e361e7abcafa3a4dd5610596e8c [76/83] WIPdrm/nouveau/fifo/r535: initial support
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230713/202307130314.2OySgGXY-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230713/202307130314.2OySgGXY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307130314.2OySgGXY-lkp@intel.com/

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
