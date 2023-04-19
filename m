Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C13B43239
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Apr 2023 10:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681899829; x=1713435829;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YG3AxHNn0kodY9y1fEU7baFvzCT9nAzmkTELnNlmoRw=;
  b=R7bFu71oY66dZmGfOj9L/HBgbYSiZykTGNdo/JCC6HbACwWJ4z0IpxnL
   9RzczNPhXUOYEoi8VS8iRaxI4GjY06p3C96OmuoxQWRaZ/Rf6rzPbt+Le
   83M3pgndeyKCEOGpGRe0KEdNdqWq8vaTuPOc/vTX6NQY2wbTtXii8Fa7L
   7FxG4cc//nZkyg3GFhE6GQcSdZet/ifdkn46HaAcEjjYdHRDn6G4YV5sp
   MIG7RPTKkUchXZXEzJaBYjy+Z+MZ4t/ovJG5J/x3p6tfgbLkTGXZMJPT6
   T862PVL3my6H35u21z/wWGJpLZebKR1Saqrq7MGumQj02F1BfK92FbuQr
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="431687758"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; 
   d="scan'208";a="431687758"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2023 03:23:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="668886443"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; 
   d="scan'208";a="668886443"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 19 Apr 2023 03:23:47 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pp4yY-000eoB-2Y;
	Wed, 19 Apr 2023 10:23:46 +0000
Date: Wed, 19 Apr 2023 18:23:42 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:pr/137 1/6] drivers/gpu/drm/adp/adp_drv.c:178:27:
 warning: variable 'adp_plane' set but not used
Message-ID: <202304191845.LzPLz60S-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux pr/137
head:   a35b202ae505125b362b8abfe4544c4b26ba4203
commit: adbf5b849cacc08aeef68169c4986b663e39d8e7 [1/6] gpu: drm: adp: Add Apple Display Pipe driver
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230419/202304191845.LzPLz60S-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/AsahiLinux/linux/commit/adbf5b849cacc08aeef68169c4986b663e39d8e7
        git remote add asahilinux https://github.com/AsahiLinux/linux
        git fetch --no-tags asahilinux pr/137
        git checkout adbf5b849cacc08aeef68169c4986b663e39d8e7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/gpu/drm/adp/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304191845.LzPLz60S-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/adp/adp_drv.c: In function 'adp_plane_atomic_update':
>> drivers/gpu/drm/adp/adp_drv.c:178:27: warning: variable 'adp_plane' set but not used [-Wunused-but-set-variable]
     178 |         struct adp_plane *adp_plane;
         |                           ^~~~~~~~~
   drivers/gpu/drm/adp/adp_drv.c: At top level:
>> drivers/gpu/drm/adp/adp_drv.c:263:19: warning: no previous prototype for 'adp_plane_new' [-Wmissing-prototypes]
     263 | struct adp_plane *adp_plane_new(struct adp_drv_private *adp, u8 id)
         |                   ^~~~~~~~~~~~~
>> drivers/gpu/drm/adp/adp_drv.c:458:25: warning: no previous prototype for 'adp_fb_create' [-Wmissing-prototypes]
     458 | struct drm_framebuffer *adp_fb_create(struct drm_device *dev, struct drm_file *file,
         |                         ^~~~~~~~~~~~~


vim +/adp_plane +178 drivers/gpu/drm/adp/adp_drv.c

   173	
   174	static void adp_plane_atomic_update(struct drm_plane *plane,
   175					    struct drm_atomic_state *state)
   176	{
   177		struct adp_drv_private *adp;
 > 178		struct adp_plane *adp_plane;
   179		struct drm_rect src_rect;
   180		struct drm_gem_dma_object *obj;
   181		struct drm_framebuffer *fb;
   182		struct adp_framebuffer *afb;
   183		struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state, plane);
   184		struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state, plane);
   185		struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(new_state);
   186		struct drm_atomic_helper_damage_iter iter;
   187		struct drm_rect damage;
   188		u32 src_pos, src_size, dst_pos, dst_size;
   189		if (!plane || !new_state || !old_state)
   190			return;
   191	
   192		fb = new_state->fb;
   193		if (!fb)
   194			return;
   195		adp_plane = to_adp_plane(plane);
   196		adp = to_adp(plane->dev);
   197		afb = to_adp_fb(fb);
   198	
   199		drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE);
   200	
   201		drm_atomic_helper_damage_iter_init(&iter, old_state, new_state);
   202		drm_atomic_for_each_plane_damage(&iter, &damage) {
   203			adp_handle_damage(afb, fb, &damage, &shadow_plane_state->map[0]);
   204		}
   205	
   206		drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
   207	
   208		drm_rect_fp_to_int(&src_rect, &new_state->src);
   209		src_pos = src_rect.y1 << 16 | src_rect.x1;
   210		dst_pos = new_state->dst.y1 << 16 | new_state->dst.x1;
   211		src_size = drm_rect_height(&src_rect) << 16 | drm_rect_width(&src_rect);
   212		dst_size = drm_rect_height(&new_state->dst) << 16 |
   213			drm_rect_width(&new_state->dst);
   214		writel(src_pos, adp->be + ADBE_SRC_START);
   215		writel(src_size, adp->be + ADBE_SRC_SIZE);
   216		writel(dst_pos, adp->be + ADBE_DST_START);
   217		writel(dst_size, adp->be + ADBE_DST_SIZE);
   218		writel(afb->stride * 4, adp->be + ADBE_STRIDE);
   219		obj = drm_fb_dma_get_gem_obj(fb, 0);
   220		if (obj)
   221			writel(afb->shadow_iova, adp->be + ADBE_FB_BASE);
   222	
   223		writel(0x1, adp->be + ADBE_LAYER_EN1);
   224		writel(0x1, adp->be + ADBE_LAYER_EN2);
   225		writel(0x1, adp->be + ADBE_LAYER_EN3);
   226		writel(0x1, adp->be + ADBE_LAYER_EN4);
   227		writel(ADBE_SCALE_CTL_BYPASS, adp->be + ADBE_SCALE_CTL);
   228		writel(ADBE_LAYER_CTL_ENABLE | 0x1, adp->be + ADBE_LAYER_CTL);
   229		writel(ADBE_PIX_FMT_XRGB32, adp->be + ADBE_PIX_FMT);
   230	
   231	}
   232	
   233	static void adp_plane_atomic_disable(struct drm_plane *plane,
   234					     struct drm_atomic_state *state)
   235	{
   236		struct adp_drv_private *adp = to_adp(plane->dev);
   237		writel(0x0, adp->be + ADBE_LAYER_EN1);
   238		writel(0x0, adp->be + ADBE_LAYER_EN2);
   239		writel(0x0, adp->be + ADBE_LAYER_EN3);
   240		writel(0x0, adp->be + ADBE_LAYER_EN4);
   241		writel(ADBE_LAYER_CTL_ENABLE, adp->be + ADBE_LAYER_CTL);
   242	}
   243	
   244	static const struct drm_plane_helper_funcs adp_plane_helper_funcs = {
   245		.atomic_check = adp_plane_atomic_check,
   246		.atomic_update = adp_plane_atomic_update,
   247		.atomic_disable = adp_plane_atomic_disable,
   248		DRM_GEM_SHADOW_PLANE_HELPER_FUNCS
   249	};
   250	
   251	static const struct drm_plane_funcs adp_plane_funcs = {
   252		.update_plane = drm_atomic_helper_update_plane,
   253		.disable_plane = drm_atomic_helper_disable_plane,
   254		DRM_GEM_SHADOW_PLANE_FUNCS
   255	};
   256	
   257	static const u32 plane_formats[] = {
   258		DRM_FORMAT_XRGB8888,
   259	};
   260	
   261	#define ALL_CRTCS 1
   262	
 > 263	struct adp_plane *adp_plane_new(struct adp_drv_private *adp, u8 id)
   264	{
   265		struct drm_device *drm = &adp->drm;
   266		struct adp_plane *plane;
   267		enum drm_plane_type plane_type;
   268	
   269		plane_type = (id == 0) ? DRM_PLANE_TYPE_PRIMARY :
   270			DRM_PLANE_TYPE_OVERLAY;
   271	
   272		plane = drmm_universal_plane_alloc(drm, struct adp_plane, base_plane,
   273						   ALL_CRTCS, &adp_plane_funcs,
   274						   plane_formats, ARRAY_SIZE(plane_formats),
   275						   NULL, plane_type, "plane %d", id);
   276		if (!plane) {
   277			drm_err(drm, "failed to allocate plane");
   278			return ERR_PTR(-ENOMEM);
   279		}
   280		plane->id = id;
   281	
   282		drm_plane_helper_add(&plane->base_plane, &adp_plane_helper_funcs);
   283		drm_plane_enable_fb_damage_clips(&plane->base_plane);
   284		return plane;
   285	}
   286	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
