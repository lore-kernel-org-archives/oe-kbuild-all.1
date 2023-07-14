Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C0101371C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Jul 2023 16:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689352841; x=1720888841;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eoTEYPHIyGJ+tpvVSjzzTscVUs4c9maAJe3HaQg5PzU=;
  b=UUe+dmlFvpkuAvn49L7xi3f2slR2ua4yObADX4Ec8pg74on5/F8YlCHL
   XT/pyaYAMMD53dJ8ROfDJhFYN5xOO/LajK3GpJf6tXWzn86lJN/wZHVc5
   QhAEa/ZU82p0LE+OTN3NP0/HDpBQyJNKQg3l54vaEaspyONgzYvPqI8Po
   HIyQk4aJO+RkB9a2dsLTwgC4NzqPmDN9aFW+YH8sj9QEWGz25qSVZJ/Me
   kVovSpThnWUasQrEBNGhTNtAM3Der2Wzk1zM79WWKLXPZr4BgD9e4fyDn
   /m+jBq4lQaT2D1FTp0wRlOYqFciKxUVMxE72oB6zvEaaQHdIrWXW9NKAa
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10771"; a="350386355"
X-IronPort-AV: E=Sophos;i="6.01,206,1684825200"; 
   d="scan'208";a="350386355"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2023 09:40:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10771"; a="787899921"
X-IronPort-AV: E=Sophos;i="6.01,206,1684825200"; 
   d="scan'208";a="787899921"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 14 Jul 2023 09:40:39 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qKLqR-0007Z3-09;
	Fri, 14 Jul 2023 16:40:39 +0000
Date: Sat, 15 Jul 2023 00:40:38 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Skeggs <bskeggs@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [skeggsb-nouveau:00.02-gsp-rm 75/83]
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:417:22: sparse: sparse: Using
 plain integer as NULL pointer
Message-ID: <202307150027.chDCt3cF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/skeggsb/nouveau 00.02-gsp-rm
head:   25db92a3e5514b0563efc2877003c303512d589a
commit: 5ce5e1fc67bb93bff71dda7bf45461af9e44e213 [75/83] WIPdrm/nouveau/disp/r535: initial support
config: arc-randconfig-r073-20230713 (https://download.01.org/0day-ci/archive/20230715/202307150027.chDCt3cF-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230715/202307150027.chDCt3cF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307150027.chDCt3cF-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:417:22: sparse: sparse: Using plain integer as NULL pointer

vim +417 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c

   397	
   398	static int
   399	r535_gsp_device_event_ctor(struct nvkm_gsp_device *device, u32 handle, u32 id,
   400				   nvkm_gsp_event_func func, struct nvkm_gsp_event *event)
   401	{
   402		struct nvkm_gsp_client *client = device->object.client;
   403		struct nvkm_gsp *gsp = client->gsp;
   404		NV0005_ALLOC_PARAMETERS *args;
   405		int ret;
   406	
   407		args = nvkm_gsp_rm_alloc_get(&device->subdevice, handle,
   408					     NV01_EVENT_KERNEL_CALLBACK_EX, sizeof(*args),
   409					     &event->object);
   410		if (IS_ERR(args))
   411			return PTR_ERR(args);
   412	
   413		args->hParentClient = client->object.handle;
   414		args->hSrcResource = 0;
   415		args->hClass = NV01_EVENT_KERNEL_CALLBACK_EX;
   416		args->notifyIndex = NV01_EVENT_CLIENT_RM | id;
 > 417		args->data = 0;
   418	
   419		ret = nvkm_gsp_rm_alloc_wr(&event->object, args);
   420		if (ret)
   421			return ret;
   422	
   423		event->device = device;
   424		event->id = id;
   425	
   426		ret = r535_gsp_device_event_get(event);
   427		if (ret) {
   428			nvkm_gsp_event_dtor(event);
   429			return ret;
   430		}
   431	
   432		mutex_lock(&gsp->client_id.mutex);
   433		event->func = func;
   434		list_add(&event->head, &client->events);
   435		mutex_unlock(&gsp->client_id.mutex);
   436		return 0;
   437	}
   438	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
