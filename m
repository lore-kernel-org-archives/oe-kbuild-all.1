Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB7C1F3BA9
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 May 2025 05:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746595692; cv=none; b=f+j2oDCuHi4i/GQtQ3v5nIT/JFLKjsOV99GxyR8LJb7vwS56H6IOh8CyfY3zz2DXiYhh1CDDcmPw2yav3n6p1gQDXU1042Ka/H03oqD4it9oQdM6P8YPP2gWxZ+VXJkpp8sqB1vt0NHw/pTPAoF+YnoxXEbC7LRZE6kIeM6xKtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746595692; c=relaxed/simple;
	bh=WFe5q72jRSdjLg8gOa6HEoRUl5Fw+xO21zYQ+KPfmtU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PN6pMngYYfLColrHO0RL5jkzy/6P/KDvLBHM7jRby7faov81NQg12W4Sq+NdbmqiAub2BC22yenPw4LrQRh+nBG3W3jyhGIvOljSCoWTvY46DNtuRvueQiluOOuwXjC1EF5fuDheJrnvcdPhLkbl3DBAjidExLQP0zIp90Eze18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BgnSabFz; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BgnSabFz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746595690; x=1778131690;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WFe5q72jRSdjLg8gOa6HEoRUl5Fw+xO21zYQ+KPfmtU=;
  b=BgnSabFzSicFRrvgOiyIz0U/n/W6C80xeYKHD/zFva37pjQwuaB7fRBw
   KHIO4EUiucklBPItBPJ3A/Zm/KvI7VvDPHY+mttQm6Nd8Nd/29Lu8d2xV
   RgjRCpAwAdYNvBQD+NquiWHqZ4xf5o/nYbS4gjl21w7jdwu8id4N5pQXz
   IYc75kKIDrzwUZ8556Y+qZ0cAeBkZ01bxC3HNL0EFy7LTD4S8255pGM/y
   ymuBttzEDhO7RFXvSOSMGSlRxfqWUJLwmRjlbgD4yVZ7eWYIoQC4YgDkd
   5gXLuUBjGOpEe4/tLZUPnPB5MoR5+B2t9fFcqvmXe19qTi98HIRcPQBbw
   A==;
X-CSE-ConnectionGUID: Itp8YbZfQ+ueh0I4+HTRzQ==
X-CSE-MsgGUID: KhwHI75fSUWpDUKwbYzcsA==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="58961791"
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="58961791"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 22:28:07 -0700
X-CSE-ConnectionGUID: b3fuyB/zRwuWv9QvT6DX+g==
X-CSE-MsgGUID: szcEKgnWTPW3vabIc/FFmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="135807489"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 06 May 2025 22:28:06 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCXK8-00074l-1k;
	Wed, 07 May 2025 05:28:04 +0000
Date: Wed, 7 May 2025 13:27:14 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Javier Martinez Canillas <javierm@redhat.com>
Subject: [linux-next:master 1942/8679] drivers/gpu/drm/sysfb/efidrm.c:351:29:
 sparse: sparse: incorrect type in assignment (different address spaces)
Message-ID: <202505071342.cCE5OdbZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Thomas,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0a00723f4c2d0b273edd0737f236f103164a08eb
commit: e8bf4a1bdaeadb28d13b9a2bcfd5910fda06eede [1942/8679] drm/sysfb: efidrm: Support module builds
config: i386-randconfig-r131-20250416 (https://download.01.org/0day-ci/archive/20250507/202505071342.cCE5OdbZ-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505071342.cCE5OdbZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505071342.cCE5OdbZ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/sysfb/efidrm.c:351:29: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem *[assigned] screen_base @@     got void * @@
   drivers/gpu/drm/sysfb/efidrm.c:351:29: sparse:     expected void [noderef] __iomem *[assigned] screen_base
   drivers/gpu/drm/sysfb/efidrm.c:351:29: sparse:     got void *
   drivers/gpu/drm/sysfb/efidrm.c:354:29: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem *[assigned] screen_base @@     got void * @@
   drivers/gpu/drm/sysfb/efidrm.c:354:29: sparse:     expected void [noderef] __iomem *[assigned] screen_base
   drivers/gpu/drm/sysfb/efidrm.c:354:29: sparse:     got void *

vim +351 drivers/gpu/drm/sysfb/efidrm.c

32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  243  
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  244  /*
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  245   * Init / Cleanup
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  246   */
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  247  
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  248  static struct efidrm_device *efidrm_device_create(struct drm_driver *drv,
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  249  						  struct platform_device *pdev)
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  250  {
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  251  	const struct screen_info *si;
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  252  	const struct drm_format_info *format;
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  253  	int width, height, stride;
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  254  	u64 vsize, mem_flags;
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  255  	struct resource resbuf;
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  256  	struct resource *res;
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  257  	struct efidrm_device *efi;
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  258  	struct drm_sysfb_device *sysfb;
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  259  	struct drm_device *dev;
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  260  	struct resource *mem = NULL;
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  261  	void __iomem *screen_base;
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  262  	struct drm_plane *primary_plane;
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  263  	struct drm_crtc *crtc;
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  264  	struct drm_encoder *encoder;
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  265  	struct drm_connector *connector;
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  266  	unsigned long max_width, max_height;
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  267  	size_t nformats;
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  268  	int ret;
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  269  
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  270  	si = dev_get_platdata(&pdev->dev);
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  271  	if (!si)
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  272  		return ERR_PTR(-ENODEV);
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  273  	if (screen_info_video_type(si) != VIDEO_TYPE_EFI)
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  274  		return ERR_PTR(-ENODEV);
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  275  
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  276  	/*
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  277  	 * EFI DRM driver
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  278  	 */
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  279  
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  280  	efi = devm_drm_dev_alloc(&pdev->dev, drv, struct efidrm_device, sysfb.dev);
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  281  	if (IS_ERR(efi))
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  282  		return ERR_CAST(efi);
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  283  	sysfb = &efi->sysfb;
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  284  	dev = &sysfb->dev;
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  285  	platform_set_drvdata(pdev, dev);
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  286  
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  287  	/*
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  288  	 * Hardware settings
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  289  	 */
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  290  
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  291  	format = efidrm_get_format_si(dev, si);
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  292  	if (IS_ERR(format))
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  293  		return ERR_CAST(format);
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  294  	width = efidrm_get_width_si(dev, si);
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  295  	if (width < 0)
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  296  		return ERR_PTR(width);
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  297  	height = efidrm_get_height_si(dev, si);
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  298  	if (height < 0)
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  299  		return ERR_PTR(height);
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  300  	res = efidrm_get_memory_si(dev, si, &resbuf);
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  301  	if (!res)
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  302  		return ERR_PTR(-EINVAL);
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  303  	stride = efidrm_get_stride_si(dev, si, format, width, height, resource_size(res));
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  304  	if (stride < 0)
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  305  		return ERR_PTR(stride);
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  306  	vsize = efidrm_get_visible_size_si(dev, si, height, stride, resource_size(res));
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  307  	if (!vsize)
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  308  		return ERR_PTR(-EINVAL);
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  309  
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  310  	drm_dbg(dev, "framebuffer format=%p4cc, size=%dx%d, stride=%d bytes\n",
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  311  		&format->format, width, height, stride);
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  312  
305396ac7782c2f Thomas Zimmermann 2025-04-01  313  #ifdef CONFIG_X86
305396ac7782c2f Thomas Zimmermann 2025-04-01  314  	if (drm_edid_header_is_valid(edid_info.dummy) == 8)
305396ac7782c2f Thomas Zimmermann 2025-04-01  315  		sysfb->edid = edid_info.dummy;
305396ac7782c2f Thomas Zimmermann 2025-04-01  316  #endif
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  317  	sysfb->fb_mode = drm_sysfb_mode(width, height, 0, 0);
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  318  	sysfb->fb_format = format;
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  319  	sysfb->fb_pitch = stride;
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  320  
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  321  	/*
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  322  	 * Memory management
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  323  	 */
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  324  
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  325  	ret = devm_aperture_acquire_for_platform_device(pdev, res->start, vsize);
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  326  	if (ret) {
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  327  		drm_err(dev, "could not acquire memory range %pr: %d\n", res, ret);
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  328  		return ERR_PTR(ret);
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  329  	}
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  330  
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  331  	drm_dbg(dev, "using I/O memory framebuffer at %pr\n", res);
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  332  
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  333  	mem = devm_request_mem_region(&pdev->dev, res->start, vsize, drv->name);
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  334  	if (!mem) {
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  335  		/*
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  336  		 * We cannot make this fatal. Sometimes this comes from magic
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  337  		 * spaces our resource handlers simply don't know about. Use
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  338  		 * the I/O-memory resource as-is and try to map that instead.
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  339  		 */
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  340  		drm_warn(dev, "could not acquire memory region %pr\n", res);
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  341  		mem = res;
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  342  	}
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  343  
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  344  	mem_flags = efidrm_get_mem_flags(dev, res->start, vsize);
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  345  
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  346  	if (mem_flags & EFI_MEMORY_WC)
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  347  		screen_base = devm_ioremap_wc(&pdev->dev, mem->start, resource_size(mem));
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  348  	else if (mem_flags & EFI_MEMORY_UC)
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  349  		screen_base = devm_ioremap(&pdev->dev, mem->start, resource_size(mem));
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  350  	else if (mem_flags & EFI_MEMORY_WT)
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01 @351  		screen_base = devm_memremap(&pdev->dev, mem->start, resource_size(mem),
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  352  					    MEMREMAP_WT);
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  353  	else if (mem_flags & EFI_MEMORY_WB)
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  354  		screen_base = devm_memremap(&pdev->dev, mem->start, resource_size(mem),
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  355  					    MEMREMAP_WB);
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  356  	if (!screen_base)
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  357  		return ERR_PTR(-ENOMEM);
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  358  	iosys_map_set_vaddr_iomem(&sysfb->fb_addr, screen_base);
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  359  
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  360  	/*
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  361  	 * Modesetting
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  362  	 */
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  363  
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  364  	ret = drmm_mode_config_init(dev);
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  365  	if (ret)
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  366  		return ERR_PTR(ret);
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  367  
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  368  	max_width = max_t(unsigned long, width, DRM_SHADOW_PLANE_MAX_WIDTH);
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  369  	max_height = max_t(unsigned long, height, DRM_SHADOW_PLANE_MAX_HEIGHT);
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  370  
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  371  	dev->mode_config.min_width = width;
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  372  	dev->mode_config.max_width = max_width;
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  373  	dev->mode_config.min_height = height;
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  374  	dev->mode_config.max_height = max_height;
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  375  	dev->mode_config.preferred_depth = format->depth;
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  376  	dev->mode_config.funcs = &efidrm_mode_config_funcs;
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  377  
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  378  	/* Primary plane */
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  379  
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  380  	nformats = drm_fb_build_fourcc_list(dev, &format->format, 1,
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  381  					    efi->formats, ARRAY_SIZE(efi->formats));
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  382  
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  383  	primary_plane = &efi->primary_plane;
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  384  	ret = drm_universal_plane_init(dev, primary_plane, 0, &efidrm_primary_plane_funcs,
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  385  				       efi->formats, nformats,
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  386  				       efidrm_primary_plane_format_modifiers,
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  387  				       DRM_PLANE_TYPE_PRIMARY, NULL);
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  388  	if (ret)
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  389  		return ERR_PTR(ret);
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  390  	drm_plane_helper_add(primary_plane, &efidrm_primary_plane_helper_funcs);
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  391  	drm_plane_enable_fb_damage_clips(primary_plane);
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  392  
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  393  	/* CRTC */
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  394  
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  395  	crtc = &efi->crtc;
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  396  	ret = drm_crtc_init_with_planes(dev, crtc, primary_plane, NULL,
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  397  					&efidrm_crtc_funcs, NULL);
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  398  	if (ret)
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  399  		return ERR_PTR(ret);
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  400  	drm_crtc_helper_add(crtc, &efidrm_crtc_helper_funcs);
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  401  
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  402  	/* Encoder */
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  403  
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  404  	encoder = &efi->encoder;
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  405  	ret = drm_encoder_init(dev, encoder, &efidrm_encoder_funcs,
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  406  			       DRM_MODE_ENCODER_NONE, NULL);
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  407  	if (ret)
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  408  		return ERR_PTR(ret);
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  409  	encoder->possible_crtcs = drm_crtc_mask(crtc);
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  410  
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  411  	/* Connector */
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  412  
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  413  	connector = &efi->connector;
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  414  	ret = drm_connector_init(dev, connector, &efidrm_connector_funcs,
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  415  				 DRM_MODE_CONNECTOR_Unknown);
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  416  	if (ret)
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  417  		return ERR_PTR(ret);
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  418  	drm_connector_helper_add(connector, &efidrm_connector_helper_funcs);
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  419  	drm_connector_set_panel_orientation_with_quirk(connector,
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  420  						       DRM_MODE_PANEL_ORIENTATION_UNKNOWN,
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  421  						       width, height);
305396ac7782c2f Thomas Zimmermann 2025-04-01  422  	if (sysfb->edid)
305396ac7782c2f Thomas Zimmermann 2025-04-01  423  		drm_connector_attach_edid_property(connector);
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  424  
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  425  	ret = drm_connector_attach_encoder(connector, encoder);
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  426  	if (ret)
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  427  		return ERR_PTR(ret);
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  428  
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  429  	drm_mode_config_reset(dev);
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  430  
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  431  	return efi;
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  432  }
32ae90c66fb62e4 Thomas Zimmermann 2025-04-01  433  

:::::: The code at line 351 was first introduced by commit
:::::: 32ae90c66fb62e4f6ae859422f733dfb249f10cf drm/sysfb: Add efidrm for EFI displays

:::::: TO: Thomas Zimmermann <tzimmermann@suse.de>
:::::: CC: Thomas Zimmermann <tzimmermann@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
