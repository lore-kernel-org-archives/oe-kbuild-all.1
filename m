Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 904FE37E
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Sep 2023 03:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693798535; x=1725334535;
  h=date:from:cc:subject:message-id:mime-version;
  bh=H9vSiMyyuxftMqw06MWcS+AckODUmwMcU+i65ZE2nNs=;
  b=i01ta8aq17pgcq2GxnRzeJtXz2W3KHcmzB0JSzx7bT2gZMl3qJLb2Pys
   2b2/JiI8gJr/EAbanwa+ESxyz4HDAYnfUuNUF4FJZ7qkWdictAkQa4qtl
   95bKiM75g1aBDCZcO1r4nHK+2DV1d4aAEVwWsLeoy5K4Ywa5imi/yJNAR
   ildNBhMnN6RCHlbWATyBfD+cs03ySCvmYSF5dheOkGOTL0+uI81m3aJXx
   LD0EeC9uiFfmK7AKVbVi4CQlBYIZdtEgklrK2ZDfSYdeqHooy2sVxLvwp
   r/EzzrN6oZVcHY6kH75rxvFIQMckdN92ceJZNapTa74KdnrzOf/ZOaZDQ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="376439081"
X-IronPort-AV: E=Sophos;i="6.02,225,1688454000"; 
   d="scan'208";a="376439081"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2023 20:35:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="740610398"
X-IronPort-AV: E=Sophos;i="6.02,225,1688454000"; 
   d="scan'208";a="740610398"
Received: from lkp-server02.sh.intel.com (HELO e0b2ea88afd5) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 03 Sep 2023 20:35:32 -0700
Received: from kbuild by e0b2ea88afd5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qd0N8-00008X-0K
	for oe-kbuild-all@lists.linux.dev;
	Mon, 04 Sep 2023 03:35:30 +0000
Date: Mon, 4 Sep 2023 11:35:06 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jsarha:topic/cros-sof-v4.19 1186/6555]
 drivers/gpu/drm/qxl/qxl_fb.c:166:21: sparse: sparse: incorrect type in
 assignment (different address spaces)
Message-ID: <202309041148.ivr8iCI1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jsarha/linux topic/cros-sof-v4.19
head:   d7a3e91d8d16d1ef8653deec5a1fffc4de034a0c
commit: f6b384fd5a76513af154efc221a22bdbf57a9626 [1186/6555] UPSTREAM: qxl: refactor to use drm_fb_helper_fbdev_setup
config: x86_64-randconfig-122-20230904 (https://download.01.org/0day-ci/archive/20230904/202309041148.ivr8iCI1-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230904/202309041148.ivr8iCI1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309041148.ivr8iCI1-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/qxl/qxl_fb.c:166:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected char const *data @@     got char [noderef] <asn:2> * @@
   drivers/gpu/drm/qxl/qxl_fb.c:166:21: sparse:     expected char const *data
   drivers/gpu/drm/qxl/qxl_fb.c:166:21: sparse:     got char [noderef] <asn:2> *
>> drivers/gpu/drm/qxl/qxl_fb.c:247:27: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected char [noderef] <asn:2> *screen_base @@     got void *[assigned] shadow @@
   drivers/gpu/drm/qxl/qxl_fb.c:247:27: sparse:     expected char [noderef] <asn:2> *screen_base
   drivers/gpu/drm/qxl/qxl_fb.c:247:27: sparse:     got void *[assigned] shadow
   drivers/gpu/drm/qxl/qxl_fb.o: warning: objtool: qxlfb_create()+0x19c: sibling call from callable instruction with modified stack frame
   drivers/gpu/drm/qxl/qxl_fb.o: warning: objtool: qxlfb_create.cold()+0xa: call without frame pointer save/setup

vim +166 drivers/gpu/drm/qxl/qxl_fb.c

   130	
   131	/*
   132	 * FIXME
   133	 * It should not be necessary to have a special dirty() callback for fbdev.
   134	 */
   135	static int qxlfb_framebuffer_dirty(struct drm_framebuffer *fb,
   136					   struct drm_file *file_priv,
   137					   unsigned flags, unsigned color,
   138					   struct drm_clip_rect *clips,
   139					   unsigned num_clips)
   140	{
   141		struct qxl_device *qdev = fb->dev->dev_private;
   142		struct fb_info *info = qdev->fb_helper.fbdev;
   143		struct qxl_fb_image qxl_fb_image;
   144		struct fb_image *image = &qxl_fb_image.fb_image;
   145	
   146		/* TODO: hard coding 32 bpp */
   147		int stride = fb->pitches[0];
   148	
   149		/*
   150		 * we are using a shadow draw buffer, at qdev->surface0_shadow
   151		 */
   152		image->dx = clips->x1;
   153		image->dy = clips->y1;
   154		image->width = clips->x2 - clips->x1;
   155		image->height = clips->y2 - clips->y1;
   156		image->fg_color = 0xffffffff; /* unused, just to avoid uninitialized
   157						 warnings */
   158		image->bg_color = 0;
   159		image->depth = 32;	     /* TODO: take from somewhere? */
   160		image->cmap.start = 0;
   161		image->cmap.len = 0;
   162		image->cmap.red = NULL;
   163		image->cmap.green = NULL;
   164		image->cmap.blue = NULL;
   165		image->cmap.transp = NULL;
 > 166		image->data = info->screen_base + (clips->x1 * 4) + (stride * clips->y1);
   167	
   168		qxl_fb_image_init(&qxl_fb_image, qdev, info, NULL);
   169		qxl_draw_opaque_fb(&qxl_fb_image, stride);
   170	
   171		return 0;
   172	}
   173	
   174	static const struct drm_framebuffer_funcs qxlfb_fb_funcs = {
   175		.destroy = drm_gem_fb_destroy,
   176		.create_handle = drm_gem_fb_create_handle,
   177		.dirty = qxlfb_framebuffer_dirty,
   178	};
   179	
   180	static int qxlfb_create(struct drm_fb_helper *helper,
   181				struct drm_fb_helper_surface_size *sizes)
   182	{
   183		struct qxl_device *qdev =
   184			container_of(helper, struct qxl_device, fb_helper);
   185		struct fb_info *info;
   186		struct drm_framebuffer *fb = NULL;
   187		struct drm_mode_fb_cmd2 mode_cmd;
   188		struct drm_gem_object *gobj = NULL;
   189		struct qxl_bo *qbo = NULL;
   190		int ret;
   191		int bpp = sizes->surface_bpp;
   192		int depth = sizes->surface_depth;
   193		void *shadow;
   194	
   195		mode_cmd.width = sizes->surface_width;
   196		mode_cmd.height = sizes->surface_height;
   197	
   198		mode_cmd.pitches[0] = ALIGN(mode_cmd.width * ((bpp + 1) / 8), 64);
   199		mode_cmd.pixel_format = drm_mode_legacy_fb_format(bpp, depth);
   200	
   201		ret = qxlfb_create_pinned_object(qdev, &mode_cmd, &gobj);
   202		if (ret < 0)
   203			return ret;
   204	
   205		qbo = gem_to_qxl_bo(gobj);
   206		DRM_DEBUG_DRIVER("%dx%d %d\n", mode_cmd.width,
   207				 mode_cmd.height, mode_cmd.pitches[0]);
   208	
   209		shadow = vmalloc(array_size(mode_cmd.pitches[0], mode_cmd.height));
   210		/* TODO: what's the usual response to memory allocation errors? */
   211		BUG_ON(!shadow);
   212		DRM_DEBUG_DRIVER("surface0 at gpu offset %lld, mmap_offset %lld (virt %p, shadow %p)\n",
   213				 qxl_bo_gpu_offset(qbo), qxl_bo_mmap_offset(qbo),
   214				 qbo->kptr, shadow);
   215	
   216		info = drm_fb_helper_alloc_fbi(helper);
   217		if (IS_ERR(info)) {
   218			ret = PTR_ERR(info);
   219			goto out_unref;
   220		}
   221	
   222		info->par = helper;
   223	
   224		fb = drm_gem_fbdev_fb_create(&qdev->ddev, sizes, 64, gobj,
   225					     &qxlfb_fb_funcs);
   226		if (IS_ERR(fb)) {
   227			DRM_ERROR("Failed to create framebuffer: %ld\n", PTR_ERR(fb));
   228			ret = PTR_ERR(fb);
   229			goto out_unref;
   230		}
   231	
   232		/* setup helper with fb data */
   233		qdev->fb_helper.fb = fb;
   234	
   235		strcpy(info->fix.id, "qxldrmfb");
   236	
   237		drm_fb_helper_fill_fix(info, fb->pitches[0], fb->format->depth);
   238	
   239		info->fbops = &qxlfb_ops;
   240	
   241		/*
   242		 * TODO: using gobj->size in various places in this function. Not sure
   243		 * what the difference between the different sizes is.
   244		 */
   245		info->fix.smem_start = qdev->vram_base; /* TODO - correct? */
   246		info->fix.smem_len = gobj->size;
 > 247		info->screen_base = shadow;
   248		info->screen_size = gobj->size;
   249	
   250		drm_fb_helper_fill_var(info, &qdev->fb_helper, sizes->fb_width,
   251				       sizes->fb_height);
   252	
   253		/* setup aperture base/size for vesafb takeover */
   254		info->apertures->ranges[0].base = qdev->ddev.mode_config.fb_base;
   255		info->apertures->ranges[0].size = qdev->vram_size;
   256	
   257		info->fix.mmio_start = 0;
   258		info->fix.mmio_len = 0;
   259	
   260		if (info->screen_base == NULL) {
   261			ret = -ENOSPC;
   262			goto out_unref;
   263		}
   264	
   265		/* XXX error handling. */
   266		drm_fb_helper_defio_init(helper);
   267	
   268		DRM_INFO("fb mappable at 0x%lX, size %lu\n",  info->fix.smem_start, (unsigned long)info->screen_size);
   269		DRM_INFO("fb: depth %d, pitch %d, width %d, height %d\n",
   270			 fb->format->depth, fb->pitches[0], fb->width, fb->height);
   271		return 0;
   272	
   273	out_unref:
   274		if (qbo) {
   275			qxl_bo_kunmap(qbo);
   276			qxl_bo_unpin(qbo);
   277		}
   278		drm_gem_object_put_unlocked(gobj);
   279		return ret;
   280	}
   281	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
