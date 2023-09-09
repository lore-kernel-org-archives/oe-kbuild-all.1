Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 310A7620
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Sep 2023 04:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694234267; x=1725770267;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oJSH49btTM5yInrLq5DX9HZf/JSwJt+P9ASs+aM2iYQ=;
  b=MtuVMH21kUyocBOLYe/WHupFtIlDVUhyWOD+yUDUnDfNrQ0gAeYL9qUh
   qbbjxqXs2RP7/ckQ3AwuwFpE/U9AUcBCMCdAtVyzxKFy5wk+fKbUwicxH
   u4imeaIttb/Xbtzhqjh0MoLucYtI38nfuuqhM6J12nw/OTIxiqn6vwQO1
   32rKysEqi3nkuRLl/kWq2AnJhx+o8pFg1qOKteY4zKjBE1hXJUN0sOj+U
   CYgC955aKxIE7QOIOGO7dI+SUd9wdtjiS6tSZTpm3VjqScwECD4LWWSUW
   JGi17KmMdiDv5uGE3bJKmfy1HgThF5Vp+qJOsH6KGlrg5ROCHHCuN9pkF
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="408773867"
X-IronPort-AV: E=Sophos;i="6.02,238,1688454000"; 
   d="scan'208";a="408773867"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2023 21:37:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="866336219"
X-IronPort-AV: E=Sophos;i="6.02,238,1688454000"; 
   d="scan'208";a="866336219"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 08 Sep 2023 21:37:44 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qepj4-0002vf-0d;
	Sat, 09 Sep 2023 04:37:42 +0000
Date: Sat, 9 Sep 2023 12:36:53 +0800
From: kernel test robot <lkp@intel.com>
To: Lyude Paul <lyude@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, Ben Skeggs <bskeggs@redhat.com>
Subject: [skeggsb-nouveau:00.02-gsp-rm 10/88]
 drivers/gpu/drm/nouveau/dispnv50/disp.c:2603:1: warning: no previous
 prototype for 'nv50_display_read_hw_state'
Message-ID: <202309091214.9NPuqoAQ-lkp@intel.com>
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
commit: c38b1778a9baee914921a6743ba924907b96caa2 [10/88] drm/nouveau/kms: Add INHERIT ioctl to nvkm/nvif for reading IOR state
config: arm-defconfig (https://download.01.org/0day-ci/archive/20230909/202309091214.9NPuqoAQ-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230909/202309091214.9NPuqoAQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309091214.9NPuqoAQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/nouveau/dispnv50/disp.c:2603:1: warning: no previous prototype for 'nv50_display_read_hw_state' [-Wmissing-prototypes]
    2603 | nv50_display_read_hw_state(struct nouveau_drm *drm)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/nv50_display_read_hw_state +2603 drivers/gpu/drm/nouveau/dispnv50/disp.c

  2600	
  2601	/* Read back the currently programmed display state */
  2602	void
> 2603	nv50_display_read_hw_state(struct nouveau_drm *drm)
  2604	{
  2605		struct drm_device *dev = drm->dev;
  2606		struct drm_encoder *encoder;
  2607		struct drm_modeset_acquire_ctx ctx;
  2608		struct nv50_disp *disp = nv50_disp(dev);
  2609		int ret;
  2610	
  2611		DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
  2612	
  2613		drm_for_each_encoder(encoder, dev) {
  2614			if (encoder->encoder_type == DRM_MODE_ENCODER_DPMST)
  2615				continue;
  2616	
  2617			nv50_display_read_hw_or_state(dev, disp, nouveau_encoder(encoder));
  2618		}
  2619	
  2620		DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
  2621	}
  2622	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
