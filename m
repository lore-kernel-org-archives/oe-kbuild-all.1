Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D0127705
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Jul 2023 13:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689167339; x=1720703339;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7I7ZGgvcIAXX9dh2rqLj916DIR3A6zxluNnSoftKY3w=;
  b=iFbYAmn0KANiZcBNxR/NO+iEYXiPa6LwAE6YH6Vvhqm+WX2J5DA6EmN5
   qIfgD1F0lggF0trWwhYnlIjtIiFBW92YYA1bu8plDNWSsQX250Qy/7+CA
   qrGB6rq7YL7M97/18evlvy4dNnV63tKqXSbRHoB/2TsJ/3DEs8Ygbhzv7
   DQmsL+kZsS/JBCWsVTX9v2rKoGpS3NLOCBvQfTbeajVgD70UuDYvATHT3
   hwmtgvxm0PPXdTIeFny08MbCIUhJtUwuV9wnBALZ56alxOLWvijUIGqjB
   /+ful39oyDf1r1ZjvFsjYkT5gWQJLBCFQZSyN/5zp7wTBn58mfmc0P7n6
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="428619844"
X-IronPort-AV: E=Sophos;i="6.01,199,1684825200"; 
   d="scan'208";a="428619844"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2023 06:08:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="895624613"
X-IronPort-AV: E=Sophos;i="6.01,199,1684825200"; 
   d="scan'208";a="895624613"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 12 Jul 2023 06:08:55 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJZaQ-0005hk-2K;
	Wed, 12 Jul 2023 13:08:54 +0000
Date: Wed, 12 Jul 2023 21:08:20 +0800
From: kernel test robot <lkp@intel.com>
To: Lyude Paul <lyude@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, Ben Skeggs <bskeggs@redhat.com>
Subject: [skeggsb-nouveau:00.02-gsp-rm 17/83]
 drivers/gpu/drm/nouveau/dispnv50/disp.c:2595:1: warning: no previous
 prototype for 'nv50_display_read_hw_state'
Message-ID: <202307122146.Fo5TRqtX-lkp@intel.com>
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
commit: 7e779d2c471be5619ffc76fef0679257629b2bbe [17/83] drm/nouveau/kms: Add INHERIT ioctl to nvkm/nvif for reading IOR state
config: arm64-randconfig-r004-20230712 (https://download.01.org/0day-ci/archive/20230712/202307122146.Fo5TRqtX-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230712/202307122146.Fo5TRqtX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307122146.Fo5TRqtX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/nouveau/dispnv50/disp.c:2595:1: warning: no previous prototype for 'nv50_display_read_hw_state' [-Wmissing-prototypes]
    2595 | nv50_display_read_hw_state(struct nouveau_drm *drm)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/nv50_display_read_hw_state +2595 drivers/gpu/drm/nouveau/dispnv50/disp.c

  2592	
  2593	/* Read back the currently programmed display state */
  2594	void
> 2595	nv50_display_read_hw_state(struct nouveau_drm *drm)
  2596	{
  2597		struct drm_device *dev = drm->dev;
  2598		struct drm_encoder *encoder;
  2599		struct drm_modeset_acquire_ctx ctx;
  2600		struct nv50_disp *disp = nv50_disp(dev);
  2601		int ret;
  2602	
  2603		DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
  2604	
  2605		drm_for_each_encoder(encoder, dev) {
  2606			if (encoder->encoder_type == DRM_MODE_ENCODER_DPMST)
  2607				continue;
  2608	
  2609			nv50_display_read_hw_or_state(dev, disp, nouveau_encoder(encoder));
  2610		}
  2611	
  2612		DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
  2613	}
  2614	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
