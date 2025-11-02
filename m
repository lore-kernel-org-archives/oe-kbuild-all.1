Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D97C1F460B
	for <oe-kbuild-all@lists.linux.dev>; Sun,  2 Nov 2025 09:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762074844; cv=none; b=YEvPg2rFwEBJfty7InwR2ue/Dty9hjriU2hBLG7mDbFaT3WabXBwx34Q95E4+n2bRJRlPho5g4tAL+9cgJoXS5YYxU960f8slY1f42MqkkhGmrxTHr51UKdXwObWeU4SRDKUb3emoqDyr69tOu8m9D9YXEAmp1sBnvIh75/4LaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762074844; c=relaxed/simple;
	bh=m9Yqfdd8FsQYQit4/8vCyr0C9qYgdWSXhzQ25tMmXvE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CYtvlS7CoMGrNUxRr8sddv7+GwM44R/O0mnNz7TtaMj1OEIKX6e9u82+Y5yFp1vDj8QY/bUbo2Z6mdEZLqabDQ5w7a7ECzJm4Fz+B9rbj9MnDuWVhmr2ERtvOmoJOV58DgTalKQqYTZtjaojS/6Uxh6KmVkvlVyJvmNE4eAq9wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CS41sz7h; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CS41sz7h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762074842; x=1793610842;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=m9Yqfdd8FsQYQit4/8vCyr0C9qYgdWSXhzQ25tMmXvE=;
  b=CS41sz7h/yvcgQy8H391srifqstHiW+I4Me2+Fv0AD2jrvmZgjx03tfS
   4E+USdND9F8uEJ/3TGEG9PPm8QcYjpmCDWW5GLnHVhZghKLaPAnTiohCb
   pHtosy7kdXaF1Tss+E+bbEpa2NI11jtHHkzA4jgrzjtqAIVFkqDz2vssS
   ZFrIcvMAFE4wZNI7s2uUIawprWMYzaU/Rfr5HzYW07s4F68PjZKl9wv7N
   Mox2Fd8khjszR0dXlmSuSyOPjb/XHC+K9qGWYIl/jW+oMJuMpFhELb+qH
   gWMkznOQSvQ5MGahyu2g21GO1fZ0+k8HvVwlc+BZEpUqvGz8bNqSEJYHX
   A==;
X-CSE-ConnectionGUID: ZqRuhvx8TCGJ/Yozugf5lg==
X-CSE-MsgGUID: 9mfPbZU1TAmSKmL6SSFNJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11600"; a="64327856"
X-IronPort-AV: E=Sophos;i="6.19,273,1754982000"; 
   d="scan'208";a="64327856"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2025 01:14:01 -0800
X-CSE-ConnectionGUID: VEswVnqrShOXItqkBqlXWw==
X-CSE-MsgGUID: LKiVjC+wT5qneHllPsiTIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,273,1754982000"; 
   d="scan'208";a="223847607"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 02 Nov 2025 01:14:01 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vFU9u-000P6n-0n;
	Sun, 02 Nov 2025 09:13:58 +0000
Date: Sun, 2 Nov 2025 17:13:42 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1900/1900]
 drivers/gpu/drm/phytium/phytium_fbdev.c:96:26: sparse: sparse: incorrect
 type in assignment (different address spaces)
Message-ID: <202511021757.7lFQ9LnW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   bca20ebb0eb886b6eef61fe75d9b476d02f92611
commit: cad0702e5286d3cc80afe545de027858b855dd5a [1900/1900] DRM: Phytium display DRM driver
config: arm64-randconfig-r132-20251030 (https://download.01.org/0day-ci/archive/20251102/202511021757.7lFQ9LnW-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251102/202511021757.7lFQ9LnW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511021757.7lFQ9LnW-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/phytium/phytium_fbdev.c:96:26: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected char [noderef] <asn:2> *screen_base @@     got void * @@
   drivers/gpu/drm/phytium/phytium_fbdev.c:96:26: sparse:     expected char [noderef] <asn:2> *screen_base
   drivers/gpu/drm/phytium/phytium_fbdev.c:96:26: sparse:     got void *
   drivers/gpu/drm/phytium/phytium_fbdev.c:113:5: warning: no previous prototype for 'phytium_drm_fbdev_init' [-Wmissing-prototypes]
     113 | int phytium_drm_fbdev_init(struct drm_device *dev)
         |     ^~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/phytium_fbdev.c:144:6: warning: no previous prototype for 'phytium_drm_fbdev_fini' [-Wmissing-prototypes]
     144 | void phytium_drm_fbdev_fini(struct drm_device *dev)
         |      ^~~~~~~~~~~~~~~~~~~~~~
--
>> drivers/gpu/drm/phytium/x100_dp.c:852:6: sparse: sparse: symbol 'x100_dp_hw_spread_is_enable' was not declared. Should it be static?
>> drivers/gpu/drm/phytium/x100_dp.c:864:5: sparse: sparse: symbol 'x100_dp_hw_reset' was not declared. Should it be static?
>> drivers/gpu/drm/phytium/x100_dp.c:897:9: sparse: sparse: symbol 'x100_dp_hw_get_source_lane_count' was not declared. Should it be static?
   drivers/gpu/drm/phytium/x100_dp.c:852:6: warning: no previous prototype for 'x100_dp_hw_spread_is_enable' [-Wmissing-prototypes]
     852 | bool x100_dp_hw_spread_is_enable(struct phytium_dp_device *phytium_dp)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/x100_dp.c:864:5: warning: no previous prototype for 'x100_dp_hw_reset' [-Wmissing-prototypes]
     864 | int x100_dp_hw_reset(struct phytium_dp_device *phytium_dp)
         |     ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/x100_dp.c:897:9: warning: no previous prototype for 'x100_dp_hw_get_source_lane_count' [-Wmissing-prototypes]
     897 | uint8_t x100_dp_hw_get_source_lane_count(struct phytium_dp_device *phytium_dp)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/gpu/drm/phytium/phytium_pci.c:19:5: sparse: sparse: symbol 'dc_msi_enable' was not declared. Should it be static?
   drivers/gpu/drm/phytium/phytium_pci.c:23:6: sparse: sparse: symbol 'phytium_pci_vram_hw_init' was not declared. Should it be static?
>> drivers/gpu/drm/phytium/phytium_pci.c:37:38: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *pool_virt_addr @@     got void [noderef] <asn:2> * @@
   drivers/gpu/drm/phytium/phytium_pci.c:37:38: sparse:     expected void *pool_virt_addr
   drivers/gpu/drm/phytium/phytium_pci.c:37:38: sparse:     got void [noderef] <asn:2> *
>> drivers/gpu/drm/phytium/phytium_pci.c:63:38: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] <asn:2> *addr @@     got void *pool_virt_addr @@
   drivers/gpu/drm/phytium/phytium_pci.c:63:38: sparse:     expected void [noderef] <asn:2> *addr
   drivers/gpu/drm/phytium/phytium_pci.c:63:38: sparse:     got void *pool_virt_addr
   drivers/gpu/drm/phytium/phytium_pci.c:30:5: sparse: sparse: symbol 'phytium_pci_vram_init' was not declared. Should it be static?
   drivers/gpu/drm/phytium/phytium_pci.c:72:46: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] <asn:2> *addr @@     got void *pool_virt_addr @@
   drivers/gpu/drm/phytium/phytium_pci.c:72:46: sparse:     expected void [noderef] <asn:2> *addr
   drivers/gpu/drm/phytium/phytium_pci.c:72:46: sparse:     got void *pool_virt_addr
   drivers/gpu/drm/phytium/phytium_pci.c:68:6: sparse: sparse: symbol 'phytium_pci_vram_fini' was not declared. Should it be static?
   drivers/gpu/drm/phytium/phytium_pci.c:99:34: sparse: sparse: undefined identifier 'PCI_VENDOR_ID_PHYTIUM'
   drivers/gpu/drm/phytium/phytium_pci.c:113:34: sparse: sparse: undefined identifier 'PCI_VENDOR_ID_PHYTIUM'
   drivers/gpu/drm/phytium/phytium_pci.c:137:6: sparse: sparse: symbol 'phytium_pci_dma_fini' was not declared. Should it be static?
   drivers/gpu/drm/phytium/phytium_pci.c:375:11: sparse: sparse: undefined identifier 'PCI_VENDOR_ID_PHYTIUM'
   drivers/gpu/drm/phytium/phytium_pci.c:376:11: sparse: sparse: undefined identifier 'PCI_VENDOR_ID_PHYTIUM'
   drivers/gpu/drm/phytium/phytium_pci.c:23:6: warning: no previous prototype for 'phytium_pci_vram_hw_init' [-Wmissing-prototypes]
      23 | void phytium_pci_vram_hw_init(struct phytium_display_private *priv)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/phytium_pci.c:30:5: warning: no previous prototype for 'phytium_pci_vram_init' [-Wmissing-prototypes]
      30 | int phytium_pci_vram_init(struct pci_dev *pdev, struct phytium_display_private *priv)
         |     ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/phytium_pci.c:68:6: warning: no previous prototype for 'phytium_pci_vram_fini' [-Wmissing-prototypes]
      68 | void phytium_pci_vram_fini(struct pci_dev *pdev, struct phytium_display_private *priv)
         |      ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/phytium_pci.c:89:5: warning: no previous prototype for 'phytium_pci_dma_init' [-Wmissing-prototypes]
      89 | int phytium_pci_dma_init(struct phytium_display_private *priv)
         |     ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/phytium_pci.c: In function 'phytium_pci_dma_init':
   drivers/gpu/drm/phytium/phytium_pci.c:99:34: error: 'PCI_VENDOR_ID_PHYTIUM' undeclared (first use in this function); did you mean 'PCI_VENDOR_ID_PHILIPS'?
      99 |         gpu_dev = pci_get_device(PCI_VENDOR_ID_PHYTIUM, 0xdc20, NULL);
         |                                  ^~~~~~~~~~~~~~~~~~~~~
         |                                  PCI_VENDOR_ID_PHILIPS
   drivers/gpu/drm/phytium/phytium_pci.c:99:34: note: each undeclared identifier is reported only once for each function it appears in
   drivers/gpu/drm/phytium/phytium_pci.c: At top level:
   drivers/gpu/drm/phytium/phytium_pci.c:137:6: warning: no previous prototype for 'phytium_pci_dma_fini' [-Wmissing-prototypes]
     137 | void phytium_pci_dma_fini(struct phytium_display_private *priv)
         |      ^~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/phytium/phytium_pci.c:7:
   include/linux/pci.h:888:19: error: 'PCI_VENDOR_ID_PHYTIUM' undeclared here (not in a function); did you mean 'PCI_VENDOR_ID_PHILIPS'?
     888 |         .vendor = PCI_VENDOR_ID_##vend, .device = (dev), 44-      |                   ^~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/phytium_pci.c:375:11: note: in expansion of macro 'PCI_VDEVICE'
     375 |         { PCI_VDEVICE(PHYTIUM, 0xdc22), (kernel_ulong_t)&x100_info },
         |           ^~~~~~~~~~~
   drivers/gpu/drm/phytium/phytium_pci.c:329:12: warning: 'phytium_pci_pm_resume' defined but not used [-Wunused-function]
     329 | static int phytium_pci_pm_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/phytium_pci.c:306:12: warning: 'phytium_pci_pm_suspend' defined but not used [-Wunused-function]
     306 | static int phytium_pci_pm_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~
--
>> drivers/gpu/drm/phytium/e2000_dp.c:471:6: sparse: sparse: symbol 'e2000_dp_hw_spread_is_enable' was not declared. Should it be static?
>> drivers/gpu/drm/phytium/e2000_dp.c:476:5: sparse: sparse: symbol 'e2000_dp_hw_reset' was not declared. Should it be static?
>> drivers/gpu/drm/phytium/e2000_dp.c:491:9: sparse: sparse: symbol 'e2000_dp_hw_get_source_lane_count' was not declared. Should it be static?
   drivers/gpu/drm/phytium/e2000_dp.c:471:6: warning: no previous prototype for 'e2000_dp_hw_spread_is_enable' [-Wmissing-prototypes]
     471 | bool e2000_dp_hw_spread_is_enable(struct phytium_dp_device *phytium_dp)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/e2000_dp.c:476:5: warning: no previous prototype for 'e2000_dp_hw_reset' [-Wmissing-prototypes]
     476 | int e2000_dp_hw_reset(struct phytium_dp_device *phytium_dp)
         |     ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/e2000_dp.c:491:9: warning: no previous prototype for 'e2000_dp_hw_get_source_lane_count' [-Wmissing-prototypes]
     491 | uint8_t e2000_dp_hw_get_source_lane_count(struct phytium_dp_device *phytium_dp)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
>> drivers/gpu/drm/phytium/phytium_platform.c:32:38: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *pool_virt_addr @@     got void [noderef] <asn:2> * @@
   drivers/gpu/drm/phytium/phytium_platform.c:32:38: sparse:     expected void *pool_virt_addr
   drivers/gpu/drm/phytium/phytium_platform.c:32:38: sparse:     got void [noderef] <asn:2> *
>> drivers/gpu/drm/phytium/phytium_platform.c:55:21: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] <asn:2> *addr @@     got void *pool_virt_addr @@
   drivers/gpu/drm/phytium/phytium_platform.c:55:21: sparse:     expected void volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/phytium/phytium_platform.c:55:21: sparse:     got void *pool_virt_addr
   drivers/gpu/drm/phytium/phytium_platform.c:19:5: sparse: sparse: symbol 'phytium_platform_carveout_mem_init' was not declared. Should it be static?
   drivers/gpu/drm/phytium/phytium_platform.c:65:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] <asn:2> *addr @@     got void *pool_virt_addr @@
   drivers/gpu/drm/phytium/phytium_platform.c:65:29: sparse:     expected void volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/phytium/phytium_platform.c:65:29: sparse:     got void *pool_virt_addr
   drivers/gpu/drm/phytium/phytium_platform.c:60:6: sparse: sparse: symbol 'phytium_platform_carveout_mem_fini' was not declared. Should it be static?
   drivers/gpu/drm/phytium/phytium_platform.c:298:10: sparse: sparse: Initializer entry defined twice
   drivers/gpu/drm/phytium/phytium_platform.c:306:10: sparse:   also defined here
   drivers/gpu/drm/phytium/phytium_platform.c:19:5: warning: no previous prototype for 'phytium_platform_carveout_mem_init' [-Wmissing-prototypes]
      19 | int phytium_platform_carveout_mem_init(struct platform_device *pdev,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/phytium_platform.c:60:6: warning: no previous prototype for 'phytium_platform_carveout_mem_fini' [-Wmissing-prototypes]
      60 | void phytium_platform_carveout_mem_fini(struct platform_device *pdev,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/phytium_platform.c:253:12: warning: 'phytium_platform_pm_resume' defined but not used [-Wunused-function]
     253 | static int phytium_platform_pm_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/phytium_platform.c:245:12: warning: 'phytium_platform_pm_suspend' defined but not used [-Wunused-function]
     245 | static int phytium_platform_pm_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~

vim +96 drivers/gpu/drm/phytium/phytium_fbdev.c

    35	
    36	static int
    37	phytium_drm_fbdev_create(struct drm_fb_helper *helper, struct drm_fb_helper_surface_size *sizes)
    38	{
    39		struct phytium_display_private *priv = helper_to_drm_private(helper);
    40		struct drm_device *dev = helper->dev;
    41		unsigned int bytes_per_pixel;
    42		struct drm_mode_fb_cmd2	mode_cmd = {0};
    43		struct phytium_framebuffer *phytium_fb =  NULL;
    44		struct fb_info *fbi =  NULL;
    45		struct drm_framebuffer *fb = NULL;
    46		size_t size = 0;
    47		int ret = 0;
    48		unsigned long offset;
    49	
    50		bytes_per_pixel = DIV_ROUND_UP(sizes->surface_bpp, 8);
    51		mode_cmd.width = sizes->surface_width;
    52		mode_cmd.height = sizes->surface_height;
    53		mode_cmd.pitches[0] =  ALIGN(sizes->surface_width * bytes_per_pixel, 128);
    54		mode_cmd.pixel_format = drm_mode_legacy_fb_format(sizes->surface_bpp, sizes->surface_depth);
    55		size = PAGE_ALIGN(mode_cmd.pitches[0] * mode_cmd.height);
    56	
    57		ret = mutex_lock_interruptible(&dev->struct_mutex);
    58		if (ret < 0) {
    59			DRM_ERROR("failed to get mutex lock\n");
    60			return ret;
    61		}
    62	
    63		priv->fbdev_phytium_gem = phytium_gem_create_object(dev, size);
    64		if (!priv->fbdev_phytium_gem) {
    65			DRM_ERROR("failed to create gem object\n");
    66			return -ENOMEM;
    67		}
    68		mutex_unlock(&dev->struct_mutex);
    69	
    70		fbi = drm_fb_helper_alloc_fbi(helper);
    71		if (IS_ERR(fbi)) {
    72			DRM_DEV_ERROR(dev->dev, "Failed to create framebuffer info.");
    73			ret = PTR_ERR(fbi);
    74			goto out;
    75		}
    76	
    77		phytium_fb = phytium_fb_alloc(dev, &mode_cmd, &priv->fbdev_phytium_gem, 1);
    78		if (IS_ERR(phytium_fb)) {
    79			DRM_DEV_ERROR(dev->dev, "Failed to alloc DRM framebuffer.\n");
    80			ret = PTR_ERR(phytium_fb);
    81			goto out;
    82		}
    83	
    84		helper->fb = &(phytium_fb->base);
    85		fbi->par = helper;
    86		fbi->flags = FBINFO_FLAG_DEFAULT;
    87		fbi->fbops = &phytium_fbdev_ops;
    88	
    89		fb = helper->fb;
    90		drm_fb_helper_fill_fix(fbi, fb->pitches[0], fb->format->depth);
    91		drm_fb_helper_fill_var(fbi, helper, sizes->fb_width, sizes->fb_height);
    92	
    93		offset = fbi->var.xoffset * bytes_per_pixel;
    94		offset += fbi->var.yoffset * fb->pitches[0];
    95		dev->mode_config.fb_base = 0;
  > 96		fbi->screen_base = priv->fbdev_phytium_gem->vaddr + offset;
    97		fbi->screen_size = priv->fbdev_phytium_gem->base.size;
    98		fbi->fix.smem_len = priv->fbdev_phytium_gem->base.size;
    99		DRM_DEBUG_KMS("FB [%dx%d]-%d kvaddr=%pa offset=%ld size=%zu\n", fb->width, fb->height,
   100			       fb->format->depth, &priv->fbdev_phytium_gem->iova, offset, size);
   101		fbi->skip_vt_switch = true;
   102	
   103		return 0;
   104	out:
   105		phytium_gem_free_object(&priv->fbdev_phytium_gem->base);
   106		return ret;
   107	}
   108	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
