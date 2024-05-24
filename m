Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A97D08592F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 May 2024 10:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716548084; cv=none; b=UtadrTkbzf5IinCuGj5z8mZ5r9JeYt0ekFV0kW79dMLSRq9gJf41FqmPBHENoDUFQKbks7KzRdPuBk8CtV/9uBtyh2alypR5GoVzJFOqIpPo8CtodTJygsjjrRdLCGypnVY2pLBsIrUi1blRpabN5yyi82M9ZEOUIADwZNcnOIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716548084; c=relaxed/simple;
	bh=KoHqKLRDPnBBCvL3w50t/8EsHh2TwjanfPFNYjfowwo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z2aoL9OsWCkh0BNyXIIWTm76G+/gI/qC0d2rsigC05140I5K/0ZaJDsn77Mbabrj0GDRIH0i3MMofQw+pQvD8jdv8muiYchS6kNJqc5tOxoXnPkjLvBVUxlZAJk9ayhEJg90SxlFYPLRi+WyFAZcgFZPMoqiMp/zsyONdv08jQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RdJSiHoC; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RdJSiHoC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716548083; x=1748084083;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KoHqKLRDPnBBCvL3w50t/8EsHh2TwjanfPFNYjfowwo=;
  b=RdJSiHoCivGmBjPfNh6+wm5zRwVpnav4OddchxTVX5rDtJD6gYd+1BCc
   fn6nybQolaZWFC4EkfuUSrrkdNKtCriGB1nUTJLlwcrGWsIiRvi5+EcBd
   tQcjHWcx5AY9NKu/CqkwtAEzlQ7SEHxJx6AdALgm1wsGz56EHWVXwZHuN
   X2/6vvCFZhvx1IEvcC3U4eSfj5ZioK+jwVy8xWhclM8fWWHBVpoVdG1E6
   ZBXxguSvwkyr5ZOhwX5hX+53VrgtQt2di9xs1jzIUfBYKmLLNejKcxShw
   hVDb9iZdj4fXGc13/4FOgUOincOK8RQNbnsfNDqTxBjgMjOhYz+/OmNTK
   w==;
X-CSE-ConnectionGUID: x3A8u3amSCWJUrWalY0WHw==
X-CSE-MsgGUID: EL/VjbglQUKx1l6UaboLtQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="16748595"
X-IronPort-AV: E=Sophos;i="6.08,185,1712646000"; 
   d="scan'208";a="16748595"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2024 03:54:42 -0700
X-CSE-ConnectionGUID: Vy5zMACkTb6iMNXG+CDPMQ==
X-CSE-MsgGUID: WucLlfcHTLqDGU7fOPGOnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,185,1712646000"; 
   d="scan'208";a="34076873"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 24 May 2024 03:54:38 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sASZG-00050o-0n;
	Fri, 24 May 2024 10:54:34 +0000
Date: Fri, 24 May 2024 18:53:13 +0800
From: kernel test robot <lkp@intel.com>
To: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@redhat.com>, nouveau@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, Jocelyn Falempe <jfalempe@redhat.com>
Subject: Re: [PATCH 5/5] drm/nouveau: Add drm_panic support for nv50+
Message-ID: <202405241832.ETpErbon-lkp@intel.com>
References: <20240523130955.428233-6-jfalempe@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240523130955.428233-6-jfalempe@redhat.com>

Hi Jocelyn,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 484436ec5c2bffe8f346a09ae1cbc4cbf5e50005]

url:    https://github.com/intel-lab-lkp/linux/commits/Jocelyn-Falempe/drm-panic-Add-ABGR2101010-support/20240523-211335
base:   484436ec5c2bffe8f346a09ae1cbc4cbf5e50005
patch link:    https://lore.kernel.org/r/20240523130955.428233-6-jfalempe%40redhat.com
patch subject: [PATCH 5/5] drm/nouveau: Add drm_panic support for nv50+
config: x86_64-randconfig-r113-20240524 (https://download.01.org/0day-ci/archive/20240524/202405241832.ETpErbon-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240524/202405241832.ETpErbon-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405241832.ETpErbon-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/nouveau/dispnv50/wndw.c:675:66: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem *vaddr_iomem @@     got void *virtual @@
   drivers/gpu/drm/nouveau/dispnv50/wndw.c:675:66: sparse:     expected void [noderef] __iomem *vaddr_iomem
   drivers/gpu/drm/nouveau/dispnv50/wndw.c:675:66: sparse:     got void *virtual
   drivers/gpu/drm/nouveau/dispnv50/wndw.c: note: in included file (through include/linux/timer.h, include/linux/workqueue.h, drivers/gpu/drm/nouveau/dispnv50/disp.h, ...):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true

vim +675 drivers/gpu/drm/nouveau/dispnv50/wndw.c

   652	
   653	static int
   654	nv50_wndw_get_scanout_buffer(struct drm_plane *plane, struct drm_scanout_buffer *sb)
   655	{
   656		struct drm_framebuffer *fb;
   657		struct nouveau_bo *nvbo;
   658	
   659		if (!plane->state || !plane->state->fb)
   660			return -EINVAL;
   661	
   662		fb = plane->state->fb;
   663		nvbo = nouveau_gem_object(fb->obj[0]);
   664	
   665		/* Don't support compressed format, or multiplane yet */
   666		if (nvbo->comp || fb->format->num_planes != 1)
   667			return -EOPNOTSUPP;
   668	
   669		if (nouveau_bo_map(nvbo)) {
   670			pr_warn("nouveau bo map failed, panic won't be displayed\n");
   671			return -ENOMEM;
   672		}
   673	
   674		if (nvbo->kmap.bo_kmap_type & TTM_BO_MAP_IOMEM_MASK)
 > 675			iosys_map_set_vaddr_iomem(&sb->map[0], nvbo->kmap.virtual);
   676		else
   677			iosys_map_set_vaddr(&sb->map[0], nvbo->kmap.virtual);
   678	
   679		sb->height = fb->height;
   680		sb->width = fb->width;
   681		sb->pitch[0] = fb->pitches[0];
   682		sb->format = fb->format;
   683	
   684		/* If tiling is enabled, use the set_pixel() to display correctly */
   685		if (fb->modifier & 0xf) {
   686			sb->private = (void *) fb;
   687			sb->set_pixel = nv50_set_pixel;
   688		}
   689		return 0;
   690	}
   691	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
