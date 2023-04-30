Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D13B72F26
	for <oe-kbuild-all@lists.linux.dev>; Sun, 30 Apr 2023 21:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682890427; x=1714426427;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AUf/YF2HtLQOw7mrf3TS7ojMOHii+PVj8AWC0Y2E9j8=;
  b=bkMr3y/upl34V+We3tJHOUmiEuF7VAEtvUKw2jBV9ZZBY+IPxsopN8wh
   ml8OOGRsdG/EwxrEkoFD7VGJUbBUNzfUsEVabSYL59+I08B1ycX2ZZqVb
   cQq3zFVgHghuGcTb2lYPKEB+6h7PbLSm15WP7nPHs0YDxLqgydAR2r9rJ
   5JBchExOROSuu8RfIQEjvMK8NxyStVLet1q5OBQEJr60nmKx/vNhvPiqx
   JiN5UF9cFswBfExDwcqy2tC+OydNVSSRE7iXzqL5jlv8vM9hRNYrQUssk
   H4vkEAS8a0Ik0H/vqYPZVhggZ+ApBOzaCVWFZM3YEoQQl85jTKxD1ESJv
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="328406404"
X-IronPort-AV: E=Sophos;i="5.99,239,1677571200"; 
   d="scan'208";a="328406404"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2023 14:33:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="839647566"
X-IronPort-AV: E=Sophos;i="5.99,239,1677571200"; 
   d="scan'208";a="839647566"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 30 Apr 2023 14:33:46 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ptEfx-00008f-1h;
	Sun, 30 Apr 2023 21:33:45 +0000
Date: Mon, 1 May 2023 05:32:53 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:pr/137 1/5] drivers/gpu/drm/adp/adp_drv.c:402:5:
 warning: no previous prototype for 'adp_detect_ctx'
Message-ID: <202305010505.FXcGpsDb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux pr/137
head:   dbcd8647ff8abbc3a564e43ed16575a89fa585d3
commit: 07c9f583443dee637776b42db1da3a093a994bde [1/5] gpu: drm: adp: Add Apple Display Pipe driver
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230501/202305010505.FXcGpsDb-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/AsahiLinux/linux/commit/07c9f583443dee637776b42db1da3a093a994bde
        git remote add asahilinux https://github.com/AsahiLinux/linux
        git fetch --no-tags asahilinux pr/137
        git checkout 07c9f583443dee637776b42db1da3a093a994bde
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/gpu/drm/adp/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305010505.FXcGpsDb-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/adp/adp_drv.c:220:19: warning: no previous prototype for 'adp_plane_new' [-Wmissing-prototypes]
     220 | struct adp_plane *adp_plane_new(struct adp_drv_private *adp, u8 id)
         |                   ^~~~~~~~~~~~~
>> drivers/gpu/drm/adp/adp_drv.c:402:5: warning: no previous prototype for 'adp_detect_ctx' [-Wmissing-prototypes]
     402 | int adp_detect_ctx(struct drm_connector *connector,
         |     ^~~~~~~~~~~~~~


vim +/adp_detect_ctx +402 drivers/gpu/drm/adp/adp_drv.c

   219	
 > 220	struct adp_plane *adp_plane_new(struct adp_drv_private *adp, u8 id)
   221	{
   222		struct drm_device *drm = &adp->drm;
   223		struct adp_plane *plane;
   224		enum drm_plane_type plane_type;
   225	
   226		plane_type = (id == 0) ? DRM_PLANE_TYPE_PRIMARY :
   227			DRM_PLANE_TYPE_OVERLAY;
   228	
   229		plane = drmm_universal_plane_alloc(drm, struct adp_plane, base_plane,
   230						   ALL_CRTCS, &adp_plane_funcs,
   231						   plane_formats, ARRAY_SIZE(plane_formats),
   232						   NULL, plane_type, "plane %d", id);
   233		if (!plane) {
   234			drm_err(drm, "failed to allocate plane");
   235			return ERR_PTR(-ENOMEM);
   236		}
   237		plane->id = id;
   238	
   239		drm_plane_helper_add(&plane->base_plane, &adp_plane_helper_funcs);
   240		return plane;
   241	}
   242	
   243	static void adp_enable_vblank(struct adp_drv_private *adp)
   244	{
   245		u32 cur_ctrl;
   246	
   247		writel(ADP_INT_STATUS_INT_MASK, adp->fe + ADP_INT_STATUS);
   248	
   249		cur_ctrl = readl(adp->fe + ADP_CTRL);
   250		writel(cur_ctrl | ADP_CTRL_VBLANK_ON, adp->fe + ADP_CTRL);
   251	}
   252	
   253	static int adp_crtc_enable_vblank(struct drm_crtc *crtc)
   254	{
   255		struct drm_device *dev = crtc->dev;
   256		struct adp_drv_private *adp = to_adp(dev);
   257		adp_enable_vblank(adp);
   258	
   259		return 0;
   260	}
   261	
   262	static void adp_disable_vblank(struct adp_drv_private *adp)
   263	{
   264		u32 cur_ctrl;
   265	
   266		cur_ctrl = readl(adp->fe + ADP_CTRL);
   267		writel(cur_ctrl & ~ADP_CTRL_VBLANK_ON, adp->fe + ADP_CTRL);
   268		writel(ADP_INT_STATUS_INT_MASK, adp->fe + ADP_INT_STATUS);
   269	}
   270	
   271	static void adp_crtc_disable_vblank(struct drm_crtc *crtc)
   272	{
   273		struct drm_device *dev = crtc->dev;
   274		struct adp_drv_private *adp = to_adp(dev);
   275	
   276		adp_disable_vblank(adp);
   277	}
   278	
   279	
   280	static void adp_crtc_atomic_enable(struct drm_crtc *crtc,
   281					   struct drm_atomic_state *state)
   282	{
   283		struct adp_drv_private *adp = crtc_to_adp(crtc);
   284		writel(0x1, adp->be + ADBE_BLEND_EN2);
   285		writel(0x10, adp->be + ADBE_BLEND_EN1);
   286		writel(0x1, adp->be + ADBE_BLEND_EN3);
   287		writel(0x1, adp->be + ADBE_BLEND_BYPASS);
   288		writel(0x1, adp->be + ADBE_BLEND_EN4);
   289	}
   290	
   291	static void adp_crtc_atomic_disable(struct drm_crtc *crtc,
   292					    struct drm_atomic_state *state)
   293	{
   294		struct adp_drv_private *adp = crtc_to_adp(crtc);
   295		struct drm_crtc_state *old_state = drm_atomic_get_old_crtc_state(state, crtc);
   296	
   297		drm_atomic_helper_disable_planes_on_crtc(old_state, false);
   298	
   299		writel(0x0, adp->be + ADBE_BLEND_EN2);
   300		writel(0x0, adp->be + ADBE_BLEND_EN1);
   301		writel(0x0, adp->be + ADBE_BLEND_EN3);
   302		writel(0x0, adp->be + ADBE_BLEND_BYPASS);
   303		writel(0x0, adp->be + ADBE_BLEND_EN4);
   304		drm_crtc_vblank_off(crtc);
   305	}
   306	
   307	static void adp_crtc_atomic_flush(struct drm_crtc *crtc,
   308					  struct drm_atomic_state *state)
   309	{
   310		u32 frame_num = 1;
   311		struct adp_drv_private *adp = crtc_to_adp(crtc);
   312		struct drm_crtc_state *new_state = drm_atomic_get_new_crtc_state(state, crtc);
   313		u64 new_size = ALIGN(new_state->mode.hdisplay *
   314				     new_state->mode.vdisplay * 4, PAGE_SIZE);
   315	
   316		if (new_size != adp->mask_buf_size) {
   317			if (adp->mask_buf)
   318				dma_free_coherent(crtc->dev->dev, adp->mask_buf_size,
   319						  adp->mask_buf, adp->mask_iova);
   320			adp->mask_buf = NULL;
   321			if (new_size != 0) {
   322				adp->mask_buf = dma_alloc_coherent(crtc->dev->dev, new_size,
   323								   &adp->mask_iova, GFP_KERNEL);
   324				memset(adp->mask_buf, 0xFF, new_size);
   325				writel(adp->mask_iova, adp->be + ADBE_MASK_BUF);
   326			}
   327			adp->mask_buf_size = new_size;
   328		}
   329		writel(ADBE_FIFO_SYNC | frame_num, adp->be + ADBE_FIFO);
   330		//FIXME: use adbe flush interrupt
   331		spin_lock_irq(&crtc->dev->event_lock);
   332		if (crtc->state->event) {
   333			drm_crtc_vblank_get(crtc);
   334			adp->event = crtc->state->event;
   335		}
   336		crtc->state->event = NULL;
   337		spin_unlock_irq(&crtc->dev->event_lock);
   338	}
   339	
   340	static const struct drm_crtc_funcs adp_crtc_funcs = {
   341		.destroy = drm_crtc_cleanup,
   342		.set_config = drm_atomic_helper_set_config,
   343		.page_flip = drm_atomic_helper_page_flip,
   344		.reset = drm_atomic_helper_crtc_reset,
   345		.atomic_duplicate_state = drm_atomic_helper_crtc_duplicate_state,
   346		.atomic_destroy_state = drm_atomic_helper_crtc_destroy_state,
   347		.enable_vblank = adp_crtc_enable_vblank,
   348		.disable_vblank = adp_crtc_disable_vblank,
   349	};
   350	
   351	
   352	static const struct drm_crtc_helper_funcs adp_crtc_helper_funcs = {
   353		.atomic_enable = adp_crtc_atomic_enable,
   354		.atomic_disable = adp_crtc_atomic_disable,
   355		.atomic_flush = adp_crtc_atomic_flush,
   356	};
   357	
   358	static int adp_setup_crtc(struct adp_drv_private *adp)
   359	{
   360		struct drm_device *drm = &adp->drm;
   361		struct adp_plane *primary;
   362		int ret;
   363	
   364		primary = adp_plane_new(adp, 0);
   365		if (IS_ERR(primary))
   366			return PTR_ERR(primary);
   367	
   368		ret = drm_crtc_init_with_planes(drm, &adp->crtc, &primary->base_plane,
   369						NULL, &adp_crtc_funcs, NULL);
   370		if (ret)
   371			return ret;
   372	
   373		drm_crtc_helper_add(&adp->crtc, &adp_crtc_helper_funcs);
   374		return 0;
   375	}
   376	
   377	static int adp_get_modes(struct drm_connector *connector)
   378	{
   379		struct adp_drv_private *adp = conn_to_adp(connector);
   380		struct drm_display_mode *mode;
   381		u32 size;
   382	
   383		size = readl(adp->fe + ADP_SCREEN_SIZE);
   384		mode = drm_mode_create(connector->dev);
   385	
   386		mode->vdisplay = size >> 16;
   387		mode->hdisplay = size & 0xFFFF;
   388		mode->hsync_start = mode->hdisplay + 8;
   389		mode->hsync_end = mode->hsync_start + 80;
   390		mode->htotal = mode->hsync_end + 40;
   391		mode->vsync_start = mode->vdisplay + 1;
   392		mode->vsync_end = mode->vsync_start + 15;
   393		mode->vtotal = mode->vsync_end + 6;
   394		mode->clock = (mode->vtotal * mode->htotal * 60) / 1000;
   395		mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
   396		mode->flags = DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_NVSYNC;
   397		drm_mode_set_name(mode);
   398		drm_mode_probed_add(connector, mode);
   399		return 1;
   400	}
   401	
 > 402	int adp_detect_ctx(struct drm_connector *connector,
   403			   struct drm_modeset_acquire_ctx *ctx,
   404			   bool force) {
   405		connector->display_info.non_desktop = true;
   406		drm_object_property_set_value(&connector->base,
   407					      connector->dev->mode_config.non_desktop_property,
   408					      connector->display_info.non_desktop);
   409		return connector_status_connected;
   410	}
   411	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
