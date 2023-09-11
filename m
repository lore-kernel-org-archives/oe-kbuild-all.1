Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56012BE67
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Sep 2023 11:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694432827; x=1725968827;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=h2YvKoA3ye47o/TxcgTgNY6oqP0QgFIBMTt5MDq6lO0=;
  b=gT14Hg6EwWu+vkHisqS36/LxcPmAPbzodpPEC/WScOpWQfCqGi+vUUcP
   iQ4mmeuzqyuImFUQ2ocg5TvqXogMKT0CQLOUUNV1Yc6A8d7axTm2WgQmM
   se4IcIf5rZ2ZWmqxPKeVyYbRCDXqF8GVhiE29uPq/Oyi7Rb20pz3mTxrJ
   eWwjJUq1Ua7EDX51nPzGhU+1DlEGS90FIlwZOD2ypZ/pBrRjSVu7x005p
   2J2O5GL07KwM39NHpjopNoBjzXENccmRxVi000vilLzoX3/s7fPjiCP7/
   nep3+xdZ4qcvewIG44Sz7eE2umsUMRTwjLAdjxpikArCj34glJbC6GXG3
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="376971593"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; 
   d="scan'208";a="376971593"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2023 04:47:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="916993651"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; 
   d="scan'208";a="916993651"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 11 Sep 2023 04:47:04 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qffNd-0006Aq-29;
	Mon, 11 Sep 2023 11:47:01 +0000
Date: Mon, 11 Sep 2023 19:46:27 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Skeggs <bskeggs@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [skeggsb-nouveau:00.02-gsp-rm 80/88]
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:419:22: sparse: sparse: Using
 plain integer as NULL pointer
Message-ID: <202309111931.4LgZLQOi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/skeggsb/nouveau 00.02-gsp-rm
head:   89551217290c31848a7662d659ced417db386bc7
commit: 52636d96dc6f3067f86e6381844fd66f6e0bc44b [80/88] WIPdrm/nouveau/disp/r535: initial support
config: x86_64-randconfig-121-20230911 (https://download.01.org/0day-ci/archive/20230911/202309111931.4LgZLQOi-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230911/202309111931.4LgZLQOi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309111931.4LgZLQOi-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:419:22: sparse: sparse: Using plain integer as NULL pointer
--
>> drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c:305:1: sparse: sparse: symbol 'r535_sor_bl' was not declared. Should it be static?


vim +419 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c

   399	
   400	static int
   401	r535_gsp_device_event_ctor(struct nvkm_gsp_device *device, u32 handle, u32 id,
   402				   nvkm_gsp_event_func func, struct nvkm_gsp_event *event)
   403	{
   404		struct nvkm_gsp_client *client = device->object.client;
   405		struct nvkm_gsp *gsp = client->gsp;
   406		NV0005_ALLOC_PARAMETERS *args;
   407		int ret;
   408	
   409		args = nvkm_gsp_rm_alloc_get(&device->subdevice, handle,
   410					     NV01_EVENT_KERNEL_CALLBACK_EX, sizeof(*args),
   411					     &event->object);
   412		if (IS_ERR(args))
   413			return PTR_ERR(args);
   414	
   415		args->hParentClient = client->object.handle;
   416		args->hSrcResource = 0;
   417		args->hClass = NV01_EVENT_KERNEL_CALLBACK_EX;
   418		args->notifyIndex = NV01_EVENT_CLIENT_RM | id;
 > 419		args->data = 0;
   420	
   421		ret = nvkm_gsp_rm_alloc_wr(&event->object, args);
   422		if (ret)
   423			return ret;
   424	
   425		event->device = device;
   426		event->id = id;
   427	
   428		ret = r535_gsp_device_event_get(event);
   429		if (ret) {
   430			nvkm_gsp_event_dtor(event);
   431			return ret;
   432		}
   433	
   434		mutex_lock(&gsp->client_id.mutex);
   435		event->func = func;
   436		list_add(&event->head, &client->events);
   437		mutex_unlock(&gsp->client_id.mutex);
   438		return 0;
   439	}
   440	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
