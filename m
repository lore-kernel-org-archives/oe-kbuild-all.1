Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00CC02C19B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Nov 2023 15:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NcMTpvmP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700060560; x=1731596560;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A5KlHyoEj6gGugqur4LQsLEu0M1Vn2sZnNUmUVW037E=;
  b=NcMTpvmP082ssxYiRSS+Ku4+6JB51JET6xSrIoJX4WNqNw1ymOU0BkBB
   pABkUfCRcwiNs8iFQQSDZcu2mndvSZSfLm7j0o3sexzV+T92tYnaxqkyT
   FhIDaYH2bdMnAK9kWOXlljCJd3ZHl6GvQzo0+l5WdZ9LvyIJQnVwWvNto
   iojRq4HEe6dJNBp8EZTKy8z5Ke+sVN99FJNJFaIY0nOlG5YjYtIXOwqmh
   rd3GMYD5vlXuwtlcuw9fEb8XK1dNsM7hxLHd6+6NGZsft9tRAzx70qTMW
   BMm8Tv6msNTBJxEyS7imOhhX/X31YkW0kT4ImsxlWI08ypBY3qlIBehPe
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="3970759"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; 
   d="scan'208";a="3970759"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 07:02:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; 
   d="scan'208";a="6195313"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 15 Nov 2023 07:02:21 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3HPF-0000Qm-2l;
	Wed, 15 Nov 2023 15:02:18 +0000
Date: Wed, 15 Nov 2023 23:01:55 +0800
From: kernel test robot <lkp@intel.com>
To: Jouni =?iso-8859-1?Q?H=F6gander?= <jouni.hogander@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, intel-xe@lists.freedesktop.org,
	Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [drm-xe:drm-xe-next 4/15]
 drivers/gpu/drm/xe/display/intel_fbdev_fb.c:14:25: warning: no previous
 prototype for 'intel_fbdev_fb_alloc'
Message-ID: <202311152249.gjSKciOA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
head:   14d1d786caacdb3438d07ab86fabf2e36c8151cc
commit: 285061d4ad89d38201433b84994dac8061afa120 [4/15] fixup! drm/xe/display: Implement display support
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20231115/202311152249.gjSKciOA-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231115/202311152249.gjSKciOA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311152249.gjSKciOA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/xe/display/intel_fbdev_fb.c:14:25: warning: no previous prototype for 'intel_fbdev_fb_alloc' [-Wmissing-prototypes]
      14 | struct drm_framebuffer *intel_fbdev_fb_alloc(struct drm_fb_helper *helper,
         |                         ^~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/xe/display/intel_fbdev_fb.c:77:5: warning: no previous prototype for 'intel_fbdev_fb_fill_info' [-Wmissing-prototypes]
      77 | int intel_fbdev_fb_fill_info(struct drm_i915_private *i915, struct fb_info *info,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/intel_fbdev_fb_alloc +14 drivers/gpu/drm/xe/display/intel_fbdev_fb.c

    13	
  > 14	struct drm_framebuffer *intel_fbdev_fb_alloc(struct drm_fb_helper *helper,
    15				 struct drm_fb_helper_surface_size *sizes)
    16	{
    17		struct drm_framebuffer *fb;
    18		struct drm_device *dev = helper->dev;
    19		struct drm_i915_private *dev_priv = to_i915(dev);
    20		struct drm_mode_fb_cmd2 mode_cmd = {};
    21		struct drm_i915_gem_object *obj;
    22		int size;
    23	
    24		/* we don't do packed 24bpp */
    25		if (sizes->surface_bpp == 24)
    26			sizes->surface_bpp = 32;
    27	
    28		mode_cmd.width = sizes->surface_width;
    29		mode_cmd.height = sizes->surface_height;
    30	
    31		mode_cmd.pitches[0] = ALIGN(mode_cmd.width *
    32					    DIV_ROUND_UP(sizes->surface_bpp, 8), XE_PAGE_SIZE);
    33		mode_cmd.pixel_format = drm_mode_legacy_fb_format(sizes->surface_bpp,
    34								  sizes->surface_depth);
    35	
    36		size = mode_cmd.pitches[0] * mode_cmd.height;
    37		size = PAGE_ALIGN(size);
    38		obj = ERR_PTR(-ENODEV);
    39	
    40		if (!IS_DGFX(dev_priv)) {
    41			obj = xe_bo_create_pin_map(dev_priv, xe_device_get_root_tile(dev_priv),
    42						   NULL, size,
    43						   ttm_bo_type_kernel, XE_BO_SCANOUT_BIT |
    44						   XE_BO_CREATE_STOLEN_BIT |
    45						   XE_BO_CREATE_PINNED_BIT);
    46			if (!IS_ERR(obj))
    47				drm_info(&dev_priv->drm, "Allocated fbdev into stolen\n");
    48			else
    49				drm_info(&dev_priv->drm, "Allocated fbdev into stolen failed: %li\n", PTR_ERR(obj));
    50		}
    51		if (IS_ERR(obj)) {
    52			obj = xe_bo_create_pin_map(dev_priv, xe_device_get_root_tile(dev_priv), NULL, size,
    53						  ttm_bo_type_kernel, XE_BO_SCANOUT_BIT |
    54						  XE_BO_CREATE_VRAM_IF_DGFX(xe_device_get_root_tile(dev_priv)) |
    55						  XE_BO_CREATE_PINNED_BIT);
    56		}
    57	
    58		if (IS_ERR(obj)) {
    59			drm_err(&dev_priv->drm, "failed to allocate framebuffer (%pe)\n", obj);
    60			fb = ERR_PTR(-ENOMEM);
    61			goto err;
    62		}
    63	
    64		fb = intel_framebuffer_create(obj, &mode_cmd);
    65		if (IS_ERR(fb)) {
    66			xe_bo_unpin_map_no_vm(obj);
    67			goto err;
    68		}
    69	
    70		drm_gem_object_put(intel_bo_to_drm_bo(obj));
    71		return fb;
    72	
    73	err:
    74		return fb;
    75	}
    76	
  > 77	int intel_fbdev_fb_fill_info(struct drm_i915_private *i915, struct fb_info *info,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
