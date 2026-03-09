Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A38D4393DFE
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Mar 2026 23:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773099703; cv=none; b=lyg4ISuQdKAYfevyl9/QhUjqlPELhqcfaGdX0yjztwC9L+evefhO/BLYWtd8Db0f6Vgaljiiugx+w6gkXE4NO9pdqPK7py1JORlPaqqO6TeFuKaHY6S8G2baLaeLwg/gsv2bm1sL34qTtSqy3IXgpFCSSOnWaIZ74UuHIxjhkHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773099703; c=relaxed/simple;
	bh=zM6Kb8Ls20A38eQJnzA9cJz3wGP8racciA81/njlQX8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tkSXDDzMxhIcMRvT7ARJEpIajmh7PDjfuy+/b7cXbyOc9dj0FZOLlE3GS3Z1WvtLY4yGnj0ce2SiLbcs4oKNJEVO3vs6ZYu7qQEfjIACynS/ArSmK7phQaCRV7lt0yVQuvlddViIaS5CPkm6irusyD1M7g444B2+ntWPpWUDxcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F7YJtdfW; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F7YJtdfW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773099702; x=1804635702;
  h=date:from:to:cc:subject:message-id;
  bh=zM6Kb8Ls20A38eQJnzA9cJz3wGP8racciA81/njlQX8=;
  b=F7YJtdfWZRLEVQQlMzPDwfxHfh0eg7C8fSEymRIF3Leez/GuSfAqecMQ
   FxwQ3KZy7tBLL+9PbENnaqP7PDd0lrwFbuPUJwiZWrS3UotBj5HppGfJb
   R8QfPP7fdRLSgA+eG90YYpLFqkWBCbrOeBGjuj7z2MO44wo3yYWLNf8Qw
   dJA7m7Ji/AUGnkBmFBSSt0Mx7mi44dQ3Va/FpAcsL1RqNLZl43tNbwNef
   cMRGfd91L1yhjiihCkGw973FlYG+yMvF/kCgrp5CqfzE2Axcgg7c8cjMW
   o/VzyKYsb/OGhuL+TCxu0fPzbmmOxFrGvDjAHgpS87rTJtb1r8VlGfO/S
   A==;
X-CSE-ConnectionGUID: 5CsFgwJ3QAuO1/jLwBzx3g==
X-CSE-MsgGUID: WpruELmlTjCgN0EOrZ2ChA==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="84464413"
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; 
   d="scan'208";a="84464413"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 16:41:40 -0700
X-CSE-ConnectionGUID: z687hBikTZSU2z41V8UQYw==
X-CSE-MsgGUID: iGDpFXrCQCmONBlnsKgYzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; 
   d="scan'208";a="216770597"
Received: from lkp-server01.sh.intel.com (HELO 434e41ea3c86) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 09 Mar 2026 16:41:37 -0700
Received: from kbuild by 434e41ea3c86 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vzkEA-000000000yS-3MKT;
	Mon, 09 Mar 2026 23:41:34 +0000
Date: Tue, 10 Mar 2026 07:40:42 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Deucher <alexander.deucher@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [linux-next:master 4682/4750]
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c:1777:8: error: implicit
 declaration of function 'drm_fb_helper_gem_is_fb'; did you mean
 'drm_fb_helper_from_client'?
Message-ID: <202603100736.KcTrzKrn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   343f51842f4ed7143872f3aa116a214a5619a4b9
commit: 99ece3600fdb60fef87268c6c05c66e5d02dbeb4 [4682/4750] Merge branch 'drm-next' of https://gitlab.freedesktop.org/agd5f/linux.git
config: powerpc-randconfig-001-20260310 (https://download.01.org/0day-ci/archive/20260310/202603100736.KcTrzKrn-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260310/202603100736.KcTrzKrn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603100736.KcTrzKrn-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/amdgpu_display.c: In function 'amdgpu_display_suspend_helper':
>> drivers/gpu/drm/amd/amdgpu/amdgpu_display.c:1777:8: error: implicit declaration of function 'drm_fb_helper_gem_is_fb'; did you mean 'drm_fb_helper_from_client'? [-Werror=implicit-function-declaration]
    1777 |   if (!drm_fb_helper_gem_is_fb(dev->fb_helper, fb->obj[0])) {
         |        ^~~~~~~~~~~~~~~~~~~~~~~
         |        drm_fb_helper_from_client
   cc1: some warnings being treated as errors


vim +1777 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c

a2e15b0e6c91a13 Alex Deucher         2021-03-19  1740  
a2e15b0e6c91a13 Alex Deucher         2021-03-19  1741  int amdgpu_display_suspend_helper(struct amdgpu_device *adev)
a2e15b0e6c91a13 Alex Deucher         2021-03-19  1742  {
a2e15b0e6c91a13 Alex Deucher         2021-03-19  1743  	struct drm_device *dev = adev_to_drm(adev);
a2e15b0e6c91a13 Alex Deucher         2021-03-19  1744  	struct drm_crtc *crtc;
a2e15b0e6c91a13 Alex Deucher         2021-03-19  1745  	struct drm_connector *connector;
a2e15b0e6c91a13 Alex Deucher         2021-03-19  1746  	struct drm_connector_list_iter iter;
a2e15b0e6c91a13 Alex Deucher         2021-03-19  1747  	int r;
a2e15b0e6c91a13 Alex Deucher         2021-03-19  1748  
c69d51395a3bd39 Guchun Chen          2023-03-09  1749  	drm_kms_helper_poll_disable(dev);
c69d51395a3bd39 Guchun Chen          2023-03-09  1750  
a2e15b0e6c91a13 Alex Deucher         2021-03-19  1751  	/* turn off display hw */
a2e15b0e6c91a13 Alex Deucher         2021-03-19  1752  	drm_modeset_lock_all(dev);
a2e15b0e6c91a13 Alex Deucher         2021-03-19  1753  	drm_connector_list_iter_begin(dev, &iter);
a2e15b0e6c91a13 Alex Deucher         2021-03-19  1754  	drm_for_each_connector_iter(connector, &iter)
a2e15b0e6c91a13 Alex Deucher         2021-03-19  1755  		drm_helper_connector_dpms(connector,
a2e15b0e6c91a13 Alex Deucher         2021-03-19  1756  					  DRM_MODE_DPMS_OFF);
a2e15b0e6c91a13 Alex Deucher         2021-03-19  1757  	drm_connector_list_iter_end(&iter);
a2e15b0e6c91a13 Alex Deucher         2021-03-19  1758  	drm_modeset_unlock_all(dev);
a2e15b0e6c91a13 Alex Deucher         2021-03-19  1759  	/* unpin the front buffers and cursors */
a2e15b0e6c91a13 Alex Deucher         2021-03-19  1760  	list_for_each_entry(crtc, &dev->mode_config.crtc_list, head) {
a2e15b0e6c91a13 Alex Deucher         2021-03-19  1761  		struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
a2e15b0e6c91a13 Alex Deucher         2021-03-19  1762  		struct drm_framebuffer *fb = crtc->primary->fb;
a2e15b0e6c91a13 Alex Deucher         2021-03-19  1763  
a2e15b0e6c91a13 Alex Deucher         2021-03-19  1764  		if (amdgpu_crtc->cursor_bo && !adev->enable_virtual_display) {
a2e15b0e6c91a13 Alex Deucher         2021-03-19  1765  			struct amdgpu_bo *aobj = gem_to_amdgpu_bo(amdgpu_crtc->cursor_bo);
93125cb704919f5 Srinivasan Shanmugam 2023-07-18  1766  
a2e15b0e6c91a13 Alex Deucher         2021-03-19  1767  			r = amdgpu_bo_reserve(aobj, true);
a2e15b0e6c91a13 Alex Deucher         2021-03-19  1768  			if (r == 0) {
a2e15b0e6c91a13 Alex Deucher         2021-03-19  1769  				amdgpu_bo_unpin(aobj);
a2e15b0e6c91a13 Alex Deucher         2021-03-19  1770  				amdgpu_bo_unreserve(aobj);
a2e15b0e6c91a13 Alex Deucher         2021-03-19  1771  			}
a2e15b0e6c91a13 Alex Deucher         2021-03-19  1772  		}
a2e15b0e6c91a13 Alex Deucher         2021-03-19  1773  
93125cb704919f5 Srinivasan Shanmugam 2023-07-18  1774  		if (!fb || !fb->obj[0])
a2e15b0e6c91a13 Alex Deucher         2021-03-19  1775  			continue;
93125cb704919f5 Srinivasan Shanmugam 2023-07-18  1776  
1837c76b780a420 Thomas Zimmermann    2026-03-04 @1777  		if (!drm_fb_helper_gem_is_fb(dev->fb_helper, fb->obj[0])) {
1837c76b780a420 Thomas Zimmermann    2026-03-04  1778  			struct amdgpu_bo *robj = gem_to_amdgpu_bo(fb->obj[0]);
1837c76b780a420 Thomas Zimmermann    2026-03-04  1779  
a2e15b0e6c91a13 Alex Deucher         2021-03-19  1780  			r = amdgpu_bo_reserve(robj, true);
a2e15b0e6c91a13 Alex Deucher         2021-03-19  1781  			if (r == 0) {
a2e15b0e6c91a13 Alex Deucher         2021-03-19  1782  				amdgpu_bo_unpin(robj);
a2e15b0e6c91a13 Alex Deucher         2021-03-19  1783  				amdgpu_bo_unreserve(robj);
a2e15b0e6c91a13 Alex Deucher         2021-03-19  1784  			}
a2e15b0e6c91a13 Alex Deucher         2021-03-19  1785  		}
89e2b4373ae5215 Alex Deucher         2022-06-21  1786  	}
4b12ee6f426e5e3 Victor Zhao          2021-04-27  1787  	return 0;
a2e15b0e6c91a13 Alex Deucher         2021-03-19  1788  }
a2e15b0e6c91a13 Alex Deucher         2021-03-19  1789  

:::::: The code at line 1777 was first introduced by commit
:::::: 1837c76b780a4201e3d9f718e17c09b536df700f drm/amdgpu: Move test for fbdev GEM object into generic helper

:::::: TO: Thomas Zimmermann <tzimmermann@suse.de>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
