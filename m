Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 690E133D1
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Feb 2023 12:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676292379; x=1707828379;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ivTYYKAF1PPaNfrO9C9qYlBwpeXIAw05ZwjYvu/6lJk=;
  b=hgCvz6bGZxk9Aht5BerToNmMlVGZU+F5whPE6FfPQzZf1N1zfpWp/N+7
   EFAQwBZi5gZxNQaJs8FTxbhqiVAXRYw69NV5FdLjwGL0stu9XpVIUONXS
   balBxDZyGObZpv8o0jUBZDanZYfk/0G3eGJldTAflxMLVIuAsTG6Lswks
   4zixK6szUXCfaVcnBKDe6OVhMWzS/UOOrWEzCRVE37d6tbKC+Uajcy8+O
   aw2k0vVymhblax/+XhHl6ttv0qbT+UKxD/RUYCHGdAB5iGOA9rz0JMl75
   dTkCucrBT4ZhdVwuainkQQUTkikUY/QHrruEUBOQrDlEOZIMvOMzaUAX8
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="332189677"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; 
   d="scan'208";a="332189677"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2023 04:46:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="668797464"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; 
   d="scan'208";a="668797464"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 13 Feb 2023 04:46:17 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pRYDo-0007k5-3B;
	Mon, 13 Feb 2023 12:46:16 +0000
Date: Mon, 13 Feb 2023 20:45:41 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Skeggs <bskeggs@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [skeggsb-nouveau:01.03-gsp-ada 187/193]
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/r525.c:306:1: warning: no previous
 prototype for 'r525_fifo_runl_ctor'
Message-ID: <202302132028.rTgnaXUg-lkp@intel.com>
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
commit: a33b539e2287b9c166a7cb5be10b4a41b9ac7b98 [187/193] fifo
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230213/202302132028.rTgnaXUg-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add skeggsb-nouveau https://gitlab.freedesktop.org/skeggsb/nouveau
        git fetch --no-tags skeggsb-nouveau 01.03-gsp-ada
        git checkout a33b539e2287b9c166a7cb5be10b4a41b9ac7b98
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/gpu/drm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302132028.rTgnaXUg-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/nouveau/nvkm/engine/fifo/r525.c:306:1: warning: no previous prototype for 'r525_fifo_runl_ctor' [-Wmissing-prototypes]
     306 | r525_fifo_runl_ctor(struct nvkm_fifo *fifo)
         | ^~~~~~~~~~~~~~~~~~~


vim +/r525_fifo_runl_ctor +306 drivers/gpu/drm/nouveau/nvkm/engine/fifo/r525.c

   303	
   304	
   305	int
 > 306	r525_fifo_runl_ctor(struct nvkm_fifo *fifo)
   307	{
   308		struct nvkm_subdev *subdev = &fifo->engine.subdev;
   309		struct nvkm_gsp *gsp = subdev->device->gsp;
   310		struct nvkm_runl *runl;
   311		int ret;
   312		NV2080_CTRL_FIFO_GET_DEVICE_INFO_TABLE_PARAMS *ctrl;
   313	
   314		//XXX: chid<->userd + per-RL chid
   315		if ((ret = nvkm_chid_new(&nvkm_chan_event, subdev, 2048, 0, 2048, &fifo->cgid)) ||
   316		    (ret = nvkm_chid_new(&nvkm_chan_event, subdev, 2048, 0, 2048, &fifo->chid)))
   317			return ret;
   318	
   319		ctrl = nvkm_gsp_rm_ctrl_get(gsp, gsp->client, gsp->subdevice,
   320					    NV2080_CTRL_CMD_FIFO_GET_DEVICE_INFO_TABLE, sizeof(*ctrl));
   321		if (WARN_ON(IS_ERR(ctrl)))
   322			return PTR_ERR(ctrl);
   323	
   324		ctrl = nvkm_gsp_rm_ctrl_push(gsp, ctrl, sizeof(*ctrl));
   325		if (WARN_ON(IS_ERR(ctrl)))
   326			return PTR_ERR(ctrl);
   327	
   328		for (int i = 0; i < ctrl->numEntries; i++) {
   329			const u32 addr = ctrl->entries[i].engineData[ENGINE_INFO_TYPE_RUNLIST_PRI_BASE];
   330			const u32 engn = ctrl->entries[i].engineData[ENGINE_INFO_TYPE_RM_ENGINE_TYPE];
   331			const u32 id = ctrl->entries[i].engineData[ENGINE_INFO_TYPE_RUNLIST];
   332			enum nvkm_subdev_type type;
   333			int inst;
   334	
   335			runl = nvkm_runl_get(fifo, id, addr);
   336			if (!runl) {
   337				runl = nvkm_runl_new(fifo, id, addr, 0 /*XXX: chid<->userd + per-RL chid*/);
   338				if (WARN_ON(IS_ERR(runl)))
   339					continue;
   340			}
   341	
   342			inst = r525_fifo_engn_type(engn, &type);
   343			if (inst < 0) {
   344				nvkm_warn(subdev, "RM_ENGINE_TYPE 0x%x\n", engn);
   345				continue;
   346			}
   347	
   348			if (type == NVKM_ENGINE_CE)
   349				nvkm_runl_add(runl, engn, fifo->func->engn_ce, type, inst);
   350			else
   351				nvkm_runl_add(runl, engn, fifo->func->engn, type, inst);
   352		}
   353	
   354		nvkm_gsp_rm_ctrl_done(gsp, ctrl);
   355		return 0;
   356	}
   357	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
