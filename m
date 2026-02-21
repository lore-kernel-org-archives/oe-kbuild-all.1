Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2052D1F419A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Feb 2026 12:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771677132; cv=none; b=CdXCAqTJBmrDGF0ihWnAnNl01IoxKGOeW7paFSc5QAVzFhjm7pxfOSzWVgEu7UcD2hYVVz8NdpKCmVPRe6Q6EAROKtaUEZXyFpyKvGVia66HSaK6LR06OLjomDRa85fjchSEcJ/UhLk/Lx07/UkdNzGMz63DvhfcSFLB5/lipkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771677132; c=relaxed/simple;
	bh=IIgCsmNHPWSAgIW2TNsY+ADF8o+W0JJ5I6dE3NtKe2g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MQ9xjq2GdnjDFQDJ9mzTXnyX88RZiblC33ONrr2L2eEJvVfk6UO4vi5YSlN6kHaA2KU0z/q4e/rvIZCcfwZ75bvxZGaGex8NOe1DUQ0NEICKLHVoXcMr21cRSolclwILltK6/bCiGq8jVZkMuvUNxw+bjoglB1MfhUEaVHbAePo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lUa5Ux/6; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lUa5Ux/6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771677130; x=1803213130;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IIgCsmNHPWSAgIW2TNsY+ADF8o+W0JJ5I6dE3NtKe2g=;
  b=lUa5Ux/6szHX86dJDQZTOS3bq7dGFhSLypazb/IjZbhmh8VEF/3BKpVO
   oCqPAU6WnCvxjbPRZIVZe7C7M9+cEnKxQ6dCUF/IaXH+dT7teX40BUDlU
   5xGN7wYbzAGjZz7/LGtmiScFlQFindKtA+H5bipn6l5jWYcULXdPbZrxr
   ywnlTWDD3oSf1mJBwnLsN84/MPT/GbI04RI9sx4YhUpH8kI6Aiu//hq9k
   6CYD1QaBCOac5r7z3TMIPAW5Q0zIoPxrL4URM8LQHIvx69Hjosyty63Ph
   ctMr8EZnYztfxYGZHGPkl7BxldZqT2OzKVrDsBPO/huwqr4SkUeOo52P1
   Q==;
X-CSE-ConnectionGUID: z6JQkMlSTEKdGo5I5IouKA==
X-CSE-MsgGUID: AtzsVvZ8R6CYU7ja1Xo5Gg==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="90330532"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; 
   d="scan'208";a="90330532"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2026 04:32:07 -0800
X-CSE-ConnectionGUID: im3Sg4SMQK6apam4cEeIDQ==
X-CSE-MsgGUID: d58WRLltSJuiYac2t7IUIw==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 21 Feb 2026 04:32:05 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vtm9T-000000014uO-1bRa;
	Sat, 21 Feb 2026 12:32:03 +0000
Date: Sat, 21 Feb 2026 20:31:16 +0800
From: kernel test robot <lkp@intel.com>
To: Vinod Govindapillai <vinod.govindapillai@intel.com>,
	intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, vinod.govindapillai@intel.com,
	ville.syrjala@intel.com, uma.shankar@intel.com
Subject: Re: [PATCH v2 3/6] drm/i915/fbdev: Extract
 intel_fbdev_fb_prefer_stolen()
Message-ID: <202602212005.vv7AJP3Z-lkp@intel.com>
References: <20260220170908.201422-4-vinod.govindapillai@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260220170908.201422-4-vinod.govindapillai@intel.com>

Hi Vinod,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-i915/for-linux-next]
[also build test ERROR on drm-tip/drm-tip linus/master next-20260220]
[cannot apply to drm-i915/for-linux-next-fixes drm-xe/drm-xe-next v6.19]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vinod-Govindapillai/drm-xe-fbdev-Fix-BIOS-FB-vs-s-stolen-size-check/20260221-013114
base:   https://gitlab.freedesktop.org/drm/i915/kernel.git for-linux-next
patch link:    https://lore.kernel.org/r/20260220170908.201422-4-vinod.govindapillai%40intel.com
patch subject: [PATCH v2 3/6] drm/i915/fbdev: Extract intel_fbdev_fb_prefer_stolen()
config: x86_64-randconfig-076-20260221 (https://download.01.org/0day-ci/archive/20260221/202602212005.vv7AJP3Z-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260221/202602212005.vv7AJP3Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602212005.vv7AJP3Z-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/gpu/drm/i915/i915_initial_plane.o: in function `initial_plane_vma':
>> drivers/gpu/drm/i915/i915_initial_plane.c:120:(.text+0x103c): undefined reference to `intel_fbdev_fb_prefer_stolen'


vim +120 drivers/gpu/drm/i915/i915_initial_plane.c

    85	
    86	static struct i915_vma *
    87	initial_plane_vma(struct drm_i915_private *i915,
    88			  struct intel_initial_plane_config *plane_config)
    89	{
    90		struct intel_memory_region *mem;
    91		struct drm_i915_gem_object *obj;
    92		struct drm_mm_node orig_mm = {};
    93		struct i915_vma *vma;
    94		resource_size_t phys_base;
    95		unsigned int tiling;
    96		u32 base, size;
    97		u64 pinctl;
    98	
    99		if (plane_config->size == 0)
   100			return NULL;
   101	
   102		if (!initial_plane_phys(i915, plane_config))
   103			return NULL;
   104	
   105		phys_base = plane_config->phys_base;
   106		mem = plane_config->mem;
   107	
   108		base = round_down(plane_config->base, I915_GTT_MIN_ALIGNMENT);
   109		size = round_up(plane_config->base + plane_config->size,
   110				mem->min_page_size);
   111		size -= base;
   112	
   113		/*
   114		 * If the FB is too big, just don't use it since fbdev is not very
   115		 * important and we should probably use that space with FBC or other
   116		 * features.
   117		 */
   118		if (IS_ENABLED(CONFIG_FRAMEBUFFER_CONSOLE) &&
   119		    mem == i915->mm.stolen_region &&
 > 120		    !intel_fbdev_fb_prefer_stolen(&i915->drm, size)) {
   121			drm_dbg_kms(&i915->drm, "Initial FB size exceeds half of stolen, discarding\n");
   122			return NULL;
   123		}
   124	
   125		obj = i915_gem_object_create_region_at(mem, phys_base, size,
   126						       I915_BO_ALLOC_USER |
   127						       I915_BO_PREALLOC);
   128		if (IS_ERR(obj)) {
   129			drm_dbg_kms(&i915->drm, "Failed to preallocate initial FB in %s\n",
   130				    mem->region.name);
   131			return NULL;
   132		}
   133	
   134		/*
   135		 * Mark it WT ahead of time to avoid changing the
   136		 * cache_level during fbdev initialization. The
   137		 * unbind there would get stuck waiting for rcu.
   138		 */
   139		i915_gem_object_set_cache_coherency(obj, HAS_WT(i915) ?
   140						    I915_CACHE_WT : I915_CACHE_NONE);
   141	
   142		tiling = intel_fb_modifier_to_tiling(plane_config->fb->base.modifier);
   143	
   144		switch (tiling) {
   145		case I915_TILING_NONE:
   146			break;
   147		case I915_TILING_X:
   148		case I915_TILING_Y:
   149			obj->tiling_and_stride =
   150				plane_config->fb->base.pitches[0] |
   151				tiling;
   152			break;
   153		default:
   154			MISSING_CASE(tiling);
   155			goto err_obj;
   156		}
   157	
   158		/*
   159		 * MTL GOP likes to place the framebuffer high up in ggtt,
   160		 * which can cause problems for ggtt_reserve_guc_top().
   161		 * Try to pin it to a low ggtt address instead to avoid that.
   162		 */
   163		base = 0;
   164	
   165		if (base != plane_config->base) {
   166			struct i915_ggtt *ggtt = to_gt(i915)->ggtt;
   167			int ret;
   168	
   169			/*
   170			 * Make sure the original and new locations
   171			 * can't overlap. That would corrupt the original
   172			 * PTEs which are still being used for scanout.
   173			 */
   174			ret = i915_gem_gtt_reserve(&ggtt->vm, NULL, &orig_mm,
   175						   size, plane_config->base,
   176						   I915_COLOR_UNEVICTABLE, PIN_NOEVICT);
   177			if (ret)
   178				goto err_obj;
   179		}
   180	
   181		vma = i915_vma_instance(obj, &to_gt(i915)->ggtt->vm, NULL);
   182		if (IS_ERR(vma))
   183			goto err_obj;
   184	
   185	retry:
   186		pinctl = PIN_GLOBAL | PIN_OFFSET_FIXED | base;
   187		if (!i915_gem_object_is_lmem(obj))
   188			pinctl |= PIN_MAPPABLE;
   189		if (i915_vma_pin(vma, 0, 0, pinctl)) {
   190			if (drm_mm_node_allocated(&orig_mm)) {
   191				drm_mm_remove_node(&orig_mm);
   192				/*
   193				 * Try again, but this time pin
   194				 * it to its original location.
   195				 */
   196				base = plane_config->base;
   197				goto retry;
   198			}
   199			goto err_obj;
   200		}
   201	
   202		if (i915_gem_object_is_tiled(obj) &&
   203		    !i915_vma_is_map_and_fenceable(vma))
   204			goto err_obj;
   205	
   206		if (drm_mm_node_allocated(&orig_mm))
   207			drm_mm_remove_node(&orig_mm);
   208	
   209		drm_dbg_kms(&i915->drm,
   210			    "Initial plane fb bound to 0x%x in the ggtt (original 0x%x)\n",
   211			    i915_ggtt_offset(vma), plane_config->base);
   212	
   213		return vma;
   214	
   215	err_obj:
   216		if (drm_mm_node_allocated(&orig_mm))
   217			drm_mm_remove_node(&orig_mm);
   218		i915_gem_object_put(obj);
   219		return NULL;
   220	}
   221	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
