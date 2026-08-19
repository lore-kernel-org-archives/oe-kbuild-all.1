Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC9AD36C9D0
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Aug 2026 20:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787173154; cv=none; b=jX2V/qRFuXQYDqweUfNZh4wtR9vuiDpc39NBbrokFBPuitoG4PH8jb0V54jZg5JEYjQ8Eb8jle7oH+345hMF0+5+HUcEMlumJr0eF9Cw/6PwlTTsTy5iPx/DAwceQVv6htLJ01FKpCBqmPCkqzWF4tk8/5OP98PgCk5N8m3Q+0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787173154; c=relaxed/simple;
	bh=oNGvlw+ClIP7oArpLfCPRLpdTiHOIwu/uYV96JIQLt4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SPt9nxABC41m2vGwFgGJAa2dYJH4TWxb43UpguqZ8xwXRSeX8FFzEAHumYl8b0jf2NcacWxsSIhEy5UD62KzfrE0F5rkz8t8YaD5nO7m1SAWqNXAimsqFTJrRmDw4CmQ8JpgCUWXQPDquYO/ogAcq7dMX/X4MmrjhBfy3FokYrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DzsQ9dr4; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DzsQ9dr4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787173153; x=1818709153;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oNGvlw+ClIP7oArpLfCPRLpdTiHOIwu/uYV96JIQLt4=;
  b=DzsQ9dr4tJ676dygYnF2JJZ/7q6bvXEhD2xNZQcHV4droyu94G+jKkbP
   2Vgq/UILzFuy/6oKIyhhi+yRsORqqkNDWbFw3bhgghdpwsA+yNPj23DqS
   x7yCqIw2ktMl7EIQDVWKl1bCm+iMUtR7pDoAFVYRcMu5sk0i+yxWa/iEe
   58+8UwHOXko4rcfmRsKBKjyXiS8p1selBq436ydklShlL2NAj+9CkmIFa
   EHnzFse9WX7/K6/ab3uDLr/66FBm/+kuqbgiofa+q+T0GGJ+chT3FOLCg
   vJN+HkPw2/Li3M1y1apDzUZSbCTV5rcsJF98U6h3Wld49puVL6zkkIJfZ
   g==;
X-CSE-ConnectionGUID: h3OmsZ6nRryhfAX+JNCG/Q==
X-CSE-MsgGUID: yMWhCcDOTL+OKRRkNvj7ww==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="105084995"
X-IronPort-AV: E=Sophos;i="6.25,232,1779174000"; 
   d="scan'208";a="105084995"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 13:59:06 -0700
X-CSE-ConnectionGUID: kNRim2MmT6irzjh7HPzFMg==
X-CSE-MsgGUID: e9VCYOGJSaihfikiQpvPyw==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 19 Aug 2026 13:59:02 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwnNE-00000000gSD-038t;
	Wed, 19 Aug 2026 20:59:00 +0000
Date: Thu, 20 Aug 2026 04:58:06 +0800
From: kernel test robot <lkp@intel.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC] drm/verisilicon: Switch to drm_fb_dma_get_addr() for
 framebuffer addresses
Message-ID: <202608200439.C2DMMV97-lkp@intel.com>
References: <20260807104819.1295812-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260807104819.1295812-1-wenst@chromium.org>

Hi Chen-Yu,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on v7.2]
[also build test ERROR on linus/master next-20260818]
[cannot apply to drm-misc/drm-misc-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chen-Yu-Tsai/drm-verisilicon-Switch-to-drm_fb_dma_get_addr-for-framebuffer-addresses/20260807-184818
base:   v7.2
patch link:    https://lore.kernel.org/r/20260807104819.1295812-1-wenst%40chromium.org
patch subject: [PATCH RFC] drm/verisilicon: Switch to drm_fb_dma_get_addr() for framebuffer addresses
config: alpha-allmodconfig (https://download.01.org/0day-ci/archive/20260820/202608200439.C2DMMV97-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260820/202608200439.C2DMMV97-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608200439.C2DMMV97-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/verisilicon/vs_primary_plane.c: In function 'vs_primary_plane_atomic_update':
>> drivers/gpu/drm/verisilicon/vs_primary_plane.c:133:20: error: implicit declaration of function 'drm_fb_dma_get_gem_addr' [-Wimplicit-function-declaration]
     133 |         dma_addr = drm_fb_dma_get_gem_addr(fb, 0);
         |                    ^~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/gpu/drm/verisilicon/vs_cursor_plane.c: In function 'vs_cursor_plane_atomic_update':
>> drivers/gpu/drm/verisilicon/vs_cursor_plane.c:180:20: error: implicit declaration of function 'drm_fb_dma_get_gem_addr' [-Wimplicit-function-declaration]
     180 |         dma_addr = drm_fb_dma_get_gem_addr(fb, 0);
         |                    ^~~~~~~~~~~~~~~~~~~~~~~


vim +/drm_fb_dma_get_gem_addr +133 drivers/gpu/drm/verisilicon/vs_primary_plane.c

    96	
    97	static void vs_primary_plane_atomic_update(struct drm_plane *plane,
    98						   struct drm_atomic_commit *atomic_state)
    99	{
   100		struct drm_plane_state *state = drm_atomic_get_new_plane_state(atomic_state,
   101									       plane);
   102		struct vs_plane_state *vs_state = to_vs_plane_state(state);
   103		struct drm_framebuffer *fb = state->fb;
   104		struct drm_crtc *crtc = state->crtc;
   105		struct vs_dc *dc;
   106		struct vs_crtc *vcrtc;
   107		unsigned int output;
   108		dma_addr_t dma_addr;
   109	
   110		if (!state->visible) {
   111			vs_primary_plane_atomic_disable(plane, atomic_state);
   112			return;
   113		}
   114	
   115		vcrtc = drm_crtc_to_vs_crtc(crtc);
   116		output = vcrtc->id;
   117		dc = vcrtc->dc;
   118	
   119		regmap_update_bits(dc->regs, VSDC_FB_CONFIG(output),
   120				   VSDC_FB_CONFIG_FMT_MASK,
   121				   VSDC_FB_CONFIG_FMT(vs_state->format.color));
   122		regmap_update_bits(dc->regs, VSDC_FB_CONFIG(output),
   123				   VSDC_FB_CONFIG_SWIZZLE_MASK,
   124				   VSDC_FB_CONFIG_SWIZZLE(vs_state->format.swizzle));
   125		regmap_assign_bits(dc->regs, VSDC_FB_CONFIG(output),
   126				   VSDC_FB_CONFIG_UV_SWIZZLE_EN,
   127				   vs_state->format.uv_swizzle);
   128	
   129		/*
   130		 * Primary plane cannot be moved, no clipping is involved,
   131		 * so the non-clipped framebuffer address can be used.
   132		 */
 > 133		dma_addr = drm_fb_dma_get_gem_addr(fb, 0);
   134	
   135		regmap_write(dc->regs, VSDC_FB_ADDRESS(output),
   136			     lower_32_bits(dma_addr));
   137		regmap_write(dc->regs, VSDC_FB_STRIDE(output),
   138			     fb->pitches[0]);
   139	
   140		regmap_write(dc->regs, VSDC_FB_TOP_LEFT(output),
   141			     VSDC_MAKE_PLANE_POS(state->crtc_x, state->crtc_y));
   142		regmap_write(dc->regs, VSDC_FB_BOTTOM_RIGHT(output),
   143			     VSDC_MAKE_PLANE_POS(state->crtc_x + state->crtc_w,
   144						 state->crtc_y + state->crtc_h));
   145		regmap_write(dc->regs, VSDC_FB_SIZE(output),
   146			     VSDC_MAKE_PLANE_SIZE(state->crtc_w, state->crtc_h));
   147	
   148		regmap_write(dc->regs, VSDC_FB_BLEND_CONFIG(output),
   149			     VSDC_FB_BLEND_CONFIG_BLEND_DISABLE);
   150	
   151		vs_primary_plane_commit(dc, output);
   152	}
   153	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
