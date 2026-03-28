Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7586C378D87
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Mar 2026 15:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774713345; cv=none; b=gRlpVFtnBKqGqNozbE9zxXZd31wF3J6OIZQZ2fjiVi3+uEZLoXgBv+a0DyJOLH+Kjq9jB2TsCntXox5unVnsvU69Tcbq+Y48zEGL/iL7OsHNjMhqFaJPtLu7o1ymby5B2taiJrTvY0kVk63L3ukuk7CbpgaUZVoJyaujAYVPQF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774713345; c=relaxed/simple;
	bh=Po+QDyvBG3842NWgLuInLllWr4xq3NsyBBiWVwU0+ok=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D/fe2U7E8DAtzfJV3zB16QJx7R9l/IshqNsIAJht+7Yqee0UcDDu9ln9ag8c/k1uf2NjLmn7azUDxgLKlds6MjPnIvaF2RDF5lqQkZ5RfKBCpza6TPgS7C02E0S7taBkRhGjn5ytI//mZepL965a9JOl0Dkpjgra3fTRyEo7QA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aTj1LWB4; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aTj1LWB4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774713343; x=1806249343;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Po+QDyvBG3842NWgLuInLllWr4xq3NsyBBiWVwU0+ok=;
  b=aTj1LWB40g7D2KJvgzpGbtL60ZSFmggoJYzd5wH2PxAe1WXn6EQVWQbg
   RCsDy006h+k6Y4GEWmQnOMWPsAwldo2MJC6TLfXikUwu2ep15G24jd9VR
   JiRlc6FM2HPgMXM//jThqho+bUyaDVdzB1QLcOTx/thHNDGIzWl+R0nXT
   CZjomInrU1p+616Tczfu6jeb9IvkXiqlNW6dpmoHN4GNAYzkUThR6tpmR
   hxIsBvWTuSpulvfDGuJ3n71Er8jR5McBZiHzmXMPWMQWcrMJjfgueKbEC
   Gx29Sm6TZywZJDZ9FDNxx/IuP+WnXOA1H0RnQ/3PMwn9muqxSjseb6MYy
   w==;
X-CSE-ConnectionGUID: 741oQaiKSJ6XFmNoau4jhQ==
X-CSE-MsgGUID: MBBwaPPxTtSIlK4GMKbARw==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="86382476"
X-IronPort-AV: E=Sophos;i="6.23,146,1770624000"; 
   d="scan'208";a="86382476"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2026 08:55:42 -0700
X-CSE-ConnectionGUID: has1g+NZSPGdP7WtM7Tecg==
X-CSE-MsgGUID: Mw2wMriZR6+qwIF/ReE0fA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,146,1770624000"; 
   d="scan'208";a="225492423"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 28 Mar 2026 08:55:40 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6W0e-00000000BXl-3hxY;
	Sat, 28 Mar 2026 15:55:36 +0000
Date: Sat, 28 Mar 2026 23:54:54 +0800
From: kernel test robot <lkp@intel.com>
To: Chen-Yu Tsai <wenst@chromium.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: oe-kbuild-all@lists.linux.dev, Rob Herring <robh@kernel.org>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Chen-Yu Tsai <wenst@chromium.org>
Subject: Re: [PATCH v3 2/3] drm/gem-dma: Use the dma_*_attr API variant
Message-ID: <202603282331.VKpi5ANh-lkp@intel.com>
References: <20260326100248.1171828-3-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260326100248.1171828-3-wenst@chromium.org>

Hi Chen-Yu,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on next-20260327]
[cannot apply to sunxi/sunxi/for-next linus/master v7.0-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chen-Yu-Tsai/drm-Introduce-DRM_MODE_DUMB_KERNEL_MAP-flag/20260328-141115
base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
patch link:    https://lore.kernel.org/r/20260326100248.1171828-3-wenst%40chromium.org
patch subject: [PATCH v3 2/3] drm/gem-dma: Use the dma_*_attr API variant
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20260328/202603282331.VKpi5ANh-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260328/202603282331.VKpi5ANh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603282331.VKpi5ANh-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c: In function 'rcar_du_vsp_map_fb':
>> drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c:296:82: error: expected ')' before 'gem'
     296 |                                                     gem->dma_addr, gem->base.size
         |                                                                                  ^
         |                                                                                  )
     297 |                                                     gem->dma_attrs);
         |                                                     ~~~                           
   drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c:295:52: note: to match this '('
     295 |                         ret = dma_get_sgtable_attrs(rcdu->dev, sgt, gem->vaddr,
         |                                                    ^
>> drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c:295:31: error: too few arguments to function 'dma_get_sgtable_attrs'; expected 6, have 5
     295 |                         ret = dma_get_sgtable_attrs(rcdu->dev, sgt, gem->vaddr,
         |                               ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/dma-buf.h:21,
                    from include/drm/drm_gem.h:38,
                    from include/drm/drm_gem_dma_helper.h:7,
                    from drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c:18:
   include/linux/dma-mapping.h:172:5: note: declared here
     172 | int dma_get_sgtable_attrs(struct device *dev, struct sg_table *sgt,
         |     ^~~~~~~~~~~~~~~~~~~~~


vim +296 drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c

   258	
   259	int rcar_du_vsp_map_fb(struct rcar_du_vsp *vsp, struct drm_framebuffer *fb,
   260			       struct sg_table sg_tables[3])
   261	{
   262		struct rcar_du_device *rcdu = vsp->dev;
   263		unsigned int i, j;
   264		int ret;
   265	
   266		for (i = 0; i < fb->format->num_planes; ++i) {
   267			struct drm_gem_dma_object *gem = drm_fb_dma_get_gem_obj(fb, i);
   268			struct sg_table *sgt = &sg_tables[i];
   269	
   270			if (gem->sgt) {
   271				struct scatterlist *src;
   272				struct scatterlist *dst;
   273	
   274				/*
   275				 * If the GEM buffer has a scatter gather table, it has
   276				 * been imported from a dma-buf and has no physical
   277				 * address as it might not be physically contiguous.
   278				 * Copy the original scatter gather table to map it to
   279				 * the VSP.
   280				 */
   281				ret = sg_alloc_table(sgt, gem->sgt->orig_nents,
   282						     GFP_KERNEL);
   283				if (ret)
   284					goto fail;
   285	
   286				src = gem->sgt->sgl;
   287				dst = sgt->sgl;
   288				for (j = 0; j < gem->sgt->orig_nents; ++j) {
   289					sg_set_page(dst, sg_page(src), src->length,
   290						    src->offset);
   291					src = sg_next(src);
   292					dst = sg_next(dst);
   293				}
   294			} else {
 > 295				ret = dma_get_sgtable_attrs(rcdu->dev, sgt, gem->vaddr,
 > 296							    gem->dma_addr, gem->base.size
   297							    gem->dma_attrs);
   298				if (ret)
   299					goto fail;
   300			}
   301	
   302			ret = vsp1_du_map_sg(vsp->vsp, sgt);
   303			if (ret) {
   304				sg_free_table(sgt);
   305				goto fail;
   306			}
   307		}
   308	
   309		return 0;
   310	
   311	fail:
   312		while (i--) {
   313			struct sg_table *sgt = &sg_tables[i];
   314	
   315			vsp1_du_unmap_sg(vsp->vsp, sgt);
   316			sg_free_table(sgt);
   317		}
   318	
   319		return ret;
   320	}
   321	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
