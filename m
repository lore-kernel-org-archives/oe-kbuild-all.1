Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59DC62FD66B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Jan 2026 18:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768417098; cv=none; b=uTuD4jg/hJDhs/w+0/JB0M5FJ0/szTimYH44jgATZhx6ZBVk1Ci/aKLe+Uyh+qrmJtzS0OaMoJX5+Sh0yH3jP1lw1wca/HFBDvYNaMBwJHLe9s38m1CPHR7IleiZHM2KZSEwijdZgSnpluqsC+I6M5WK6xJXCS20xNTuoC15Dg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768417098; c=relaxed/simple;
	bh=/3yJXN6SbCbGn56lLswcwEXiAvT9vhyTyw8Ny04xpA0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=siF+myNLUD+kZFrkuQ2upYTExzoBjiaF1c7sWzS2emnTgDuhZPEurufAmNASsFOdTUROZX39S4bncaGv8y6z4h8GT39kshrskXmHqKGR+1L7pCNmCus2GcxV9+knhC2YTkjtvkEiQZrl0rny/ZKtn1j37f42luUEol7FPA7JnxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W2N0THSf; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W2N0THSf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768417096; x=1799953096;
  h=date:from:to:cc:subject:message-id;
  bh=/3yJXN6SbCbGn56lLswcwEXiAvT9vhyTyw8Ny04xpA0=;
  b=W2N0THSf1myGuWKSFVkCkVr9S/8Gk4Mjyuss+ovYZbU8MdkqKozyQr8+
   WCiLGiXgvAJ3TDh8yZwS/8WxJPHmaaK12WIV20bdg+xy2rtedd518V7UV
   wIOJdv5lAZ6lTR9e5iaV+wEj0qPQWGGUJynPJqXke6FFdGjihmj1PSoym
   tkc7XSr7GF/Pour9FNpLQAklVBsewOS9JnpypNRgJVqEWN+z2hY1Fxaqr
   CJkTXdvUvTB+neIhq9xGpCs3GG2vu7TEuUnhyFZoE7l/GdvZJDDDqEbtN
   OfuTWNFDZwAYZJ7GBFX2fqKdsgvTkUuRujamwK0Z/Q3mjAJLLPI4gWSCY
   w==;
X-CSE-ConnectionGUID: WxuPiZjIRkKFsXifQhXXOQ==
X-CSE-MsgGUID: AZSBaIlHSseqyaqTYbDTAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="69634142"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="69634142"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 10:58:16 -0800
X-CSE-ConnectionGUID: kmtDMHzXQCaQrwLZOSzaFA==
X-CSE-MsgGUID: XWdRPJLaTni2Jhiklq5G6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="208918516"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 14 Jan 2026 10:58:14 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vg64I-00000000Grg-3rtH;
	Wed, 14 Jan 2026 18:58:10 +0000
Date: Thu, 15 Jan 2026 02:57:53 +0800
From: kernel test robot <lkp@intel.com>
To: Ido Schimmel <idosch@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Petr Machata <petrm@nvidia.com>
Subject: [jpirko-mlxsw:combined_queue 19/19]
 drivers/gpu/drm/sysfb/efidrm.c:244:29: sparse: sparse: incorrect type in
 assignment (different address spaces)
Message-ID: <202601150249.fvsjLvSc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/jpirko/linux_mlxsw combined_queue
head:   9f03fb7d9fa1cb50683fa639e6ccbdc94628f8e6
commit: 9f03fb7d9fa1cb50683fa639e6ccbdc94628f8e6 [19/19] TMP: Revert "module: Add compile-time check for embedded NUL characters"
config: loongarch-randconfig-r111-20260114 (https://download.01.org/0day-ci/archive/20260115/202601150249.fvsjLvSc-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260115/202601150249.fvsjLvSc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601150249.fvsjLvSc-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/sysfb/efidrm.c:244:29: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem *[assigned] screen_base @@     got void * @@
   drivers/gpu/drm/sysfb/efidrm.c:244:29: sparse:     expected void [noderef] __iomem *[assigned] screen_base
   drivers/gpu/drm/sysfb/efidrm.c:244:29: sparse:     got void *
   drivers/gpu/drm/sysfb/efidrm.c:247:29: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem *[assigned] screen_base @@     got void * @@
   drivers/gpu/drm/sysfb/efidrm.c:247:29: sparse:     expected void [noderef] __iomem *[assigned] screen_base
   drivers/gpu/drm/sysfb/efidrm.c:247:29: sparse:     got void *

vim +244 drivers/gpu/drm/sysfb/efidrm.c

32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  136  
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  137  /*
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  138   * Init / Cleanup
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  139   */
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  140  
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  141  static struct efidrm_device *efidrm_device_create(struct drm_driver *drv,
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  142  						  struct platform_device *pdev)
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  143  {
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  144  	const struct screen_info *si;
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  145  	const struct drm_format_info *format;
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  146  	int width, height, stride;
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  147  	u64 vsize, mem_flags;
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  148  	struct resource resbuf;
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  149  	struct resource *res;
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  150  	struct efidrm_device *efi;
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  151  	struct drm_sysfb_device *sysfb;
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  152  	struct drm_device *dev;
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  153  	struct resource *mem = NULL;
746375524bb6a93 Nathan Chancellor 2025-04-10  154  	void __iomem *screen_base = NULL;
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  155  	struct drm_plane *primary_plane;
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  156  	struct drm_crtc *crtc;
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  157  	struct drm_encoder *encoder;
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  158  	struct drm_connector *connector;
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  159  	unsigned long max_width, max_height;
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  160  	size_t nformats;
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  161  	int ret;
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  162  
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  163  	si = dev_get_platdata(&pdev->dev);
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  164  	if (!si)
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  165  		return ERR_PTR(-ENODEV);
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  166  	if (screen_info_video_type(si) != VIDEO_TYPE_EFI)
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  167  		return ERR_PTR(-ENODEV);
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  168  
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  169  	/*
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  170  	 * EFI DRM driver
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  171  	 */
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  172  
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  173  	efi = devm_drm_dev_alloc(&pdev->dev, drv, struct efidrm_device, sysfb.dev);
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  174  	if (IS_ERR(efi))
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  175  		return ERR_CAST(efi);
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  176  	sysfb = &efi->sysfb;
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  177  	dev = &sysfb->dev;
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  178  	platform_set_drvdata(pdev, dev);
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  179  
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  180  	/*
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  181  	 * Hardware settings
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  182  	 */
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  183  
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  184  	format = efidrm_get_format_si(dev, si);
e8c086880b2bac0 Thomas Zimmermann 2025-04-10  185  	if (!format)
e8c086880b2bac0 Thomas Zimmermann 2025-04-10  186  		return ERR_PTR(-EINVAL);
e8c086880b2bac0 Thomas Zimmermann 2025-04-10  187  	width = drm_sysfb_get_width_si(dev, si);
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  188  	if (width < 0)
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  189  		return ERR_PTR(width);
e8c086880b2bac0 Thomas Zimmermann 2025-04-10  190  	height = drm_sysfb_get_height_si(dev, si);
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  191  	if (height < 0)
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  192  		return ERR_PTR(height);
e8c086880b2bac0 Thomas Zimmermann 2025-04-10  193  	res = drm_sysfb_get_memory_si(dev, si, &resbuf);
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  194  	if (!res)
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  195  		return ERR_PTR(-EINVAL);
e8c086880b2bac0 Thomas Zimmermann 2025-04-10  196  	stride = drm_sysfb_get_stride_si(dev, si, format, width, height, resource_size(res));
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  197  	if (stride < 0)
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  198  		return ERR_PTR(stride);
e8c086880b2bac0 Thomas Zimmermann 2025-04-10  199  	vsize = drm_sysfb_get_visible_size_si(dev, si, height, stride, resource_size(res));
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  200  	if (!vsize)
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  201  		return ERR_PTR(-EINVAL);
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  202  
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  203  	drm_dbg(dev, "framebuffer format=%p4cc, size=%dx%d, stride=%d bytes\n",
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  204  		&format->format, width, height, stride);
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  205  
33b4e4fcd2980ee Thomas Zimmermann 2025-06-02  206  #if defined(CONFIG_FIRMWARE_EDID)
305396ac7782c2f Thomas Zimmermann 2025-04-01  207  	if (drm_edid_header_is_valid(edid_info.dummy) == 8)
305396ac7782c2f Thomas Zimmermann 2025-04-01  208  		sysfb->edid = edid_info.dummy;
305396ac7782c2f Thomas Zimmermann 2025-04-01  209  #endif
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  210  	sysfb->fb_mode = drm_sysfb_mode(width, height, 0, 0);
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  211  	sysfb->fb_format = format;
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  212  	sysfb->fb_pitch = stride;
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  213  
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  214  	/*
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  215  	 * Memory management
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  216  	 */
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  217  
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  218  	ret = devm_aperture_acquire_for_platform_device(pdev, res->start, vsize);
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  219  	if (ret) {
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  220  		drm_err(dev, "could not acquire memory range %pr: %d\n", res, ret);
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  221  		return ERR_PTR(ret);
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  222  	}
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  223  
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  224  	drm_dbg(dev, "using I/O memory framebuffer at %pr\n", res);
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  225  
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  226  	mem = devm_request_mem_region(&pdev->dev, res->start, vsize, drv->name);
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  227  	if (!mem) {
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  228  		/*
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  229  		 * We cannot make this fatal. Sometimes this comes from magic
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  230  		 * spaces our resource handlers simply don't know about. Use
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  231  		 * the I/O-memory resource as-is and try to map that instead.
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  232  		 */
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  233  		drm_warn(dev, "could not acquire memory region %pr\n", res);
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  234  		mem = res;
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  235  	}
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  236  
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  237  	mem_flags = efidrm_get_mem_flags(dev, res->start, vsize);
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  238  
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  239  	if (mem_flags & EFI_MEMORY_WC)
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  240  		screen_base = devm_ioremap_wc(&pdev->dev, mem->start, resource_size(mem));
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  241  	else if (mem_flags & EFI_MEMORY_UC)
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  242  		screen_base = devm_ioremap(&pdev->dev, mem->start, resource_size(mem));
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  243  	else if (mem_flags & EFI_MEMORY_WT)
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01 @244  		screen_base = devm_memremap(&pdev->dev, mem->start, resource_size(mem),
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  245  					    MEMREMAP_WT);
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  246  	else if (mem_flags & EFI_MEMORY_WB)
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  247  		screen_base = devm_memremap(&pdev->dev, mem->start, resource_size(mem),
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  248  					    MEMREMAP_WB);
746375524bb6a93 Nathan Chancellor 2025-04-10  249  	else
746375524bb6a93 Nathan Chancellor 2025-04-10  250  		drm_err(dev, "invalid mem_flags: 0x%llx\n", mem_flags);
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  251  	if (!screen_base)
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  252  		return ERR_PTR(-ENOMEM);
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  253  	iosys_map_set_vaddr_iomem(&sysfb->fb_addr, screen_base);
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  254  
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  255  	/*
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  256  	 * Modesetting
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  257  	 */
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  258  
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  259  	ret = drmm_mode_config_init(dev);
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  260  	if (ret)
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  261  		return ERR_PTR(ret);
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  262  
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  263  	max_width = max_t(unsigned long, width, DRM_SHADOW_PLANE_MAX_WIDTH);
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  264  	max_height = max_t(unsigned long, height, DRM_SHADOW_PLANE_MAX_HEIGHT);
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  265  
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  266  	dev->mode_config.min_width = width;
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  267  	dev->mode_config.max_width = max_width;
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  268  	dev->mode_config.min_height = height;
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  269  	dev->mode_config.max_height = max_height;
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  270  	dev->mode_config.preferred_depth = format->depth;
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  271  	dev->mode_config.funcs = &efidrm_mode_config_funcs;
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  272  
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  273  	/* Primary plane */
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  274  
1a45ef022f03641 Thomas Zimmermann 2025-06-16  275  	nformats = drm_sysfb_build_fourcc_list(dev, &format->format, 1,
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  276  					       efi->formats, ARRAY_SIZE(efi->formats));
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  277  
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  278  	primary_plane = &efi->primary_plane;
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  279  	ret = drm_universal_plane_init(dev, primary_plane, 0, &efidrm_primary_plane_funcs,
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  280  				       efi->formats, nformats,
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  281  				       efidrm_primary_plane_format_modifiers,
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  282  				       DRM_PLANE_TYPE_PRIMARY, NULL);
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  283  	if (ret)
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  284  		return ERR_PTR(ret);
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  285  	drm_plane_helper_add(primary_plane, &efidrm_primary_plane_helper_funcs);
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  286  	drm_plane_enable_fb_damage_clips(primary_plane);
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  287  
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  288  	/* CRTC */
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  289  
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  290  	crtc = &efi->crtc;
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  291  	ret = drm_crtc_init_with_planes(dev, crtc, primary_plane, NULL,
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  292  					&efidrm_crtc_funcs, NULL);
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  293  	if (ret)
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  294  		return ERR_PTR(ret);
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  295  	drm_crtc_helper_add(crtc, &efidrm_crtc_helper_funcs);
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  296  
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  297  	/* Encoder */
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  298  
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  299  	encoder = &efi->encoder;
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  300  	ret = drm_encoder_init(dev, encoder, &efidrm_encoder_funcs,
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  301  			       DRM_MODE_ENCODER_NONE, NULL);
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  302  	if (ret)
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  303  		return ERR_PTR(ret);
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  304  	encoder->possible_crtcs = drm_crtc_mask(crtc);
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  305  
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  306  	/* Connector */
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  307  
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  308  	connector = &efi->connector;
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  309  	ret = drm_connector_init(dev, connector, &efidrm_connector_funcs,
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  310  				 DRM_MODE_CONNECTOR_Unknown);
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  311  	if (ret)
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  312  		return ERR_PTR(ret);
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  313  	drm_connector_helper_add(connector, &efidrm_connector_helper_funcs);
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  314  	drm_connector_set_panel_orientation_with_quirk(connector,
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  315  						       DRM_MODE_PANEL_ORIENTATION_UNKNOWN,
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  316  						       width, height);
305396ac7782c2f Thomas Zimmermann 2025-04-01  317  	if (sysfb->edid)
305396ac7782c2f Thomas Zimmermann 2025-04-01  318  		drm_connector_attach_edid_property(connector);
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  319  
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  320  	ret = drm_connector_attach_encoder(connector, encoder);
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  321  	if (ret)
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  322  		return ERR_PTR(ret);
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  323  
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  324  	drm_mode_config_reset(dev);
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  325  
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  326  	return efi;
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  327  }
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  328  

:::::: The code at line 244 was first introduced by commit
:::::: 32ae90c66fb62e4f6ae859422f733dfb249f10cf drm/sysfb: Add efidrm for EFI displays

:::::: TO: Thomas Zimmermann <tzimmermann@suse.de>
:::::: CC: Thomas Zimmermann <tzimmermann@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
