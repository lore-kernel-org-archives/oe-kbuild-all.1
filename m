Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E3EE53A1
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Feb 2024 03:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708659164; cv=none; b=LH/sNd9SANOFLRUjpM1hmtLl8/BuxAervumWlT0oPv2wW5+j6OLYgJWt1KXJELzqmnkSEYD3BoMicU8MVOW4Z7AzEiWKCfI6KzWH6JJfIzFnVfsbq30tLP53hYustczucVZAIxpAxhiuL/WC464aFQStmVp40AxtN5f8aG1wNYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708659164; c=relaxed/simple;
	bh=xM96rLfd/eUHARn+C5/AjX0XZrOmRgBje1cNv/k68y8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OCWdKoYictOm++nTUuFpQenRgsB6NA22Iu7ti63zAX5L5N5k55n97qSEcnHx3C5TARBGQPrtBsJr1yBK4T7l91Plp6X1UszwhprTm+VQlQXqKWcfqRAUwPERvv7bTHbpppyXW+/ZjvgP/bDJJaFjtC8uqzkEhBvoqrDhjmIPVOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mu9r4cSH; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mu9r4cSH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708659162; x=1740195162;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xM96rLfd/eUHARn+C5/AjX0XZrOmRgBje1cNv/k68y8=;
  b=Mu9r4cSH7wqrRK6mDCP+hwqrq9yBvFjjibBWi1hjBWlZyM05lEYFImF2
   P5wAh8r0O8IGdof2Rj0j+2Q4bCKsZ5wGiz20F4dtaX4dbElifoP4UxPH/
   Q/QEvgVlHzx/vAwAUbnHvTlN8nPc2sBtIhb5hhFD9Y3dEBVpuJS3HEOOO
   k5EwaIOfftyHkxEoJqbC/HoWk2JCQzBcFMg4m4JEIdKFdP+02omCsDXzz
   gOeeGDT4uNgUi2TaVogWOukucWmT3VyY55uyNpoKADUy/XlXRWsHWh5ty
   rtHieRgmauedaWMUSBl6JhtfwDaP/ohfnH0pzZw/HHU3Pvsvt7mThLs2q
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="3100460"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="3100460"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2024 19:32:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="6151202"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 22 Feb 2024 19:32:38 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rdMId-00071I-2p;
	Fri, 23 Feb 2024 03:32:35 +0000
Date: Fri, 23 Feb 2024 11:32:18 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.phytium 22/41]
 drivers/gpu/drm/phytium/phytium_display_drv.c:433:1: warning: data
 definition has no type or storage class
Message-ID: <202402231103.DM4U4jFq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.phytium
head:   974a90e098c75ef0e62d4bbbde4535368a61f98b
commit: 89d90afb8afafa96563d5108a05d77644f86af28 [22/41] DRM phytium Add Phytium Display Engine support
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240223/202402231103.DM4U4jFq-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240223/202402231103.DM4U4jFq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402231103.DM4U4jFq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/phytium/phytium_display_drv.c:32:34: error: expected ')' before 'int'
      32 | module_param(dc_fake_mode_enable, int, 0644);
         |                                  ^~~~
         |                                  )
   drivers/gpu/drm/phytium/phytium_display_drv.c:33:38: error: expected ')' before string constant
      33 | MODULE_PARM_DESC(dc_fake_mode_enable, "Enable DC fake mode (0-disabled; 1-enabled; default-0)");
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                      )
   drivers/gpu/drm/phytium/phytium_display_drv.c:36:37: error: expected ')' before 'int'
      36 | module_param(dc_fast_training_check, int, 0644);
         |                                     ^~~~
         |                                     )
   drivers/gpu/drm/phytium/phytium_display_drv.c:37:41: error: expected ')' before string constant
      37 | MODULE_PARM_DESC(dc_fast_training_check, "Check dp fast training (0-disabled; 1-enabled; default-1)");
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                         )
   drivers/gpu/drm/phytium/phytium_display_drv.c:40:31: error: expected ')' before 'int'
      40 | module_param(num_source_rates, int, 0644);
         |                               ^~~~
         |                               )
   drivers/gpu/drm/phytium/phytium_display_drv.c:41:35: error: expected ')' before string constant
      41 | MODULE_PARM_DESC(num_source_rates, "set the source max rates (1-1.62Gbps; 2-2.7Gbps; 3-5.4Gbps; 4-8.1Gbps; default-4)");
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                   )
   drivers/gpu/drm/phytium/phytium_display_drv.c:44:36: error: expected ')' before 'int'
      44 | module_param(source_max_lane_count, int, 0644);
         |                                    ^~~~
         |                                    )
   drivers/gpu/drm/phytium/phytium_display_drv.c:45:40: error: expected ')' before string constant
      45 | MODULE_PARM_DESC(source_max_lane_count, "set the source lane count (1-1lane; 2-2lane; 4-4lane; default-4)");
         |                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                        )
   drivers/gpu/drm/phytium/phytium_display_drv.c:48:34: error: expected ')' before 'int'
      48 | module_param(link_dynamic_adjust, int, 0644);
         |                                  ^~~~
         |                                  )
   drivers/gpu/drm/phytium/phytium_display_drv.c:49:38: error: expected ')' before string constant
      49 | MODULE_PARM_DESC(link_dynamic_adjust, "dynamic select the train pamameter according to the display mode (0-disabled; 1-enabled; default-1)");
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                      )
   drivers/gpu/drm/phytium/phytium_display_drv.c: In function 'phytium_irq_preinstall':
   drivers/gpu/drm/phytium/phytium_display_drv.c:89:16: warning: variable 'status' set but not used [-Wunused-but-set-variable]
      89 |         int i, status;
         |                ^~~~~~
   drivers/gpu/drm/phytium/phytium_display_drv.c: In function 'phytium_irq_uninstall':
   drivers/gpu/drm/phytium/phytium_display_drv.c:100:16: warning: variable 'status' set but not used [-Wunused-but-set-variable]
     100 |         int i, status;
         |                ^~~~~~
   drivers/gpu/drm/phytium/phytium_display_drv.c: At top level:
>> drivers/gpu/drm/phytium/phytium_display_drv.c:433:1: warning: data definition has no type or storage class
     433 | module_init(phytium_display_init);
         | ^~~~~~~~~~~
   drivers/gpu/drm/phytium/phytium_display_drv.c:433:1: error: type defaults to 'int' in declaration of 'module_init' [-Werror=implicit-int]
>> drivers/gpu/drm/phytium/phytium_display_drv.c:433:1: warning: parameter names (without types) in function declaration
   drivers/gpu/drm/phytium/phytium_display_drv.c:434:1: warning: data definition has no type or storage class
     434 | module_exit(phytium_display_exit);
         | ^~~~~~~~~~~
   drivers/gpu/drm/phytium/phytium_display_drv.c:434:1: error: type defaults to 'int' in declaration of 'module_exit' [-Werror=implicit-int]
   drivers/gpu/drm/phytium/phytium_display_drv.c:434:1: warning: parameter names (without types) in function declaration
   drivers/gpu/drm/phytium/phytium_display_drv.c:436:16: error: expected declaration specifiers or '...' before string constant
     436 | MODULE_LICENSE("GPL");
         |                ^~~~~
   drivers/gpu/drm/phytium/phytium_display_drv.c:437:15: error: expected declaration specifiers or '...' before string constant
     437 | MODULE_AUTHOR("Yang Xun <yangxun@phytium.com.cn>");
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/phytium_display_drv.c:438:20: error: expected declaration specifiers or '...' before string constant
     438 | MODULE_DESCRIPTION("Phytium Display Controller");
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/phytium/phytium_display_drv.c:426:20: warning: 'phytium_display_exit' defined but not used [-Wunused-function]
     426 | static void __exit phytium_display_exit(void)
         |                    ^~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/phytium/phytium_display_drv.c:413:19: warning: 'phytium_display_init' defined but not used [-Wunused-function]
     413 | static int __init phytium_display_init(void)
         |                   ^~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
>> drivers/gpu/drm/phytium/px210_dc.c:69:6: warning: no previous prototype for 'px210_dc_hw_vram_init' [-Wmissing-prototypes]
      69 | void px210_dc_hw_vram_init(struct phytium_display_private *priv, resource_size_t vram_addr,
         |      ^~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/phytium/px210_dc.c:101:6: warning: no previous prototype for 'px210_dc_hw_clear_msi_irq' [-Wmissing-prototypes]
     101 | void px210_dc_hw_clear_msi_irq(struct phytium_display_private *priv, uint32_t phys_pipe)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/phytium/px210_dc.c:106:6: warning: no previous prototype for 'px210_dc_hw_config_pix_clock' [-Wmissing-prototypes]
     106 | void px210_dc_hw_config_pix_clock(struct drm_crtc *crtc, int clock)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/phytium/px210_dc.c:124:6: warning: no previous prototype for 'px210_dc_hw_disable' [-Wmissing-prototypes]
     124 | void px210_dc_hw_disable(struct drm_crtc *crtc)
         |      ^~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/phytium/px210_dc.c:172:5: warning: no previous prototype for 'px210_dc_hw_fb_format_check' [-Wmissing-prototypes]
     172 | int px210_dc_hw_fb_format_check(const struct drm_mode_fb_cmd2 *mode_cmd, int count)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/phytium/px210_dc.c:242:6: warning: no previous prototype for 'px210_dc_hw_plane_get_primary_format' [-Wmissing-prototypes]
     242 | void px210_dc_hw_plane_get_primary_format(const uint64_t **format_modifiers,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/phytium/px210_dc.c:251:6: warning: no previous prototype for 'px210_dc_hw_plane_get_cursor_format' [-Wmissing-prototypes]
     251 | void px210_dc_hw_plane_get_cursor_format(const uint64_t **format_modifiers,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/phytium/px210_dc.c:260:6: warning: no previous prototype for 'px210_dc_hw_update_dcreq' [-Wmissing-prototypes]
     260 | void px210_dc_hw_update_dcreq(struct drm_plane *plane)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/phytium/px210_dc.c:317:6: warning: no previous prototype for 'px210_dc_hw_update_primary_hi_addr' [-Wmissing-prototypes]
     317 | void px210_dc_hw_update_primary_hi_addr(struct drm_plane *plane)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/gpu/drm/phytium/phytium_pci.c:20:28: error: expected ')' before 'int'
      20 | module_param(dc_msi_enable, int, 0644);
         |                            ^~~~
         |                            )
   drivers/gpu/drm/phytium/phytium_pci.c:21:32: error: expected ')' before string constant
      21 | MODULE_PARM_DESC(dc_msi_enable, "Enable DC msi interrupt (0-disabled; 1-enabled; default-0)");
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                )
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
   drivers/gpu/drm/phytium/phytium_pci.c:137:6: warning: no previous prototype for 'phytium_pci_dma_fini' [-Wmissing-prototypes]
     137 | void phytium_pci_dma_fini(struct phytium_display_private *priv)
         |      ^~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/phytium/phytium_pci.c:379:1: warning: data definition has no type or storage class
     379 | MODULE_DEVICE_TABLE(pci, phytium_display_pci_ids);
         | ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/phytium_pci.c:379:1: error: type defaults to 'int' in declaration of 'MODULE_DEVICE_TABLE' [-Werror=implicit-int]
>> drivers/gpu/drm/phytium/phytium_pci.c:379:1: warning: parameter names (without types) in function declaration
   cc1: some warnings being treated as errors
--
>> drivers/gpu/drm/phytium/pe220x_dc.c:73:6: warning: no previous prototype for 'pe220x_dc_hw_vram_init' [-Wmissing-prototypes]
      73 | void pe220x_dc_hw_vram_init(struct phytium_display_private *priv, resource_size_t vram_addr,
         |      ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/phytium/pe220x_dc.c:87:6: warning: no previous prototype for 'pe220x_dc_hw_config_pix_clock' [-Wmissing-prototypes]
      87 | void pe220x_dc_hw_config_pix_clock(struct drm_crtc *crtc, int clock)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/phytium/pe220x_dc.c:104:6: warning: no previous prototype for 'pe220x_dc_hw_reset' [-Wmissing-prototypes]
     104 | void pe220x_dc_hw_reset(struct drm_crtc *crtc)
         |      ^~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/phytium/pe220x_dc.c:198:5: warning: no previous prototype for 'pe220x_dc_hw_fb_format_check' [-Wmissing-prototypes]
     198 | int pe220x_dc_hw_fb_format_check(const struct drm_mode_fb_cmd2 *mode_cmd, int count)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/phytium/pe220x_dc.c:210:6: warning: no previous prototype for 'pe220x_dc_hw_plane_get_primary_format' [-Wmissing-prototypes]
     210 | void pe220x_dc_hw_plane_get_primary_format(const uint64_t **format_modifiers,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/phytium/pe220x_dc.c:219:6: warning: no previous prototype for 'pe220x_dc_hw_plane_get_cursor_format' [-Wmissing-prototypes]
     219 | void pe220x_dc_hw_plane_get_cursor_format(const uint64_t **format_modifiers,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/phytium/pe220x_dc.c:228:6: warning: no previous prototype for 'pe220x_dc_hw_update_primary_hi_addr' [-Wmissing-prototypes]
     228 | void pe220x_dc_hw_update_primary_hi_addr(struct drm_plane *plane)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/phytium/pe220x_dc.c:245:6: warning: no previous prototype for 'pe220x_dc_hw_update_cursor_hi_addr' [-Wmissing-prototypes]
     245 | void pe220x_dc_hw_update_cursor_hi_addr(struct drm_plane *plane, uint64_t iova)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +433 drivers/gpu/drm/phytium/phytium_display_drv.c

   412	
 > 413	static int __init phytium_display_init(void)
   414	{
   415		int ret = 0;
   416	
   417		ret = platform_driver_register(&phytium_platform_driver);
   418		if (ret)
   419			return ret;
   420	
   421		ret = pci_register_driver(&phytium_pci_driver);
   422	
   423		return ret;
   424	}
   425	
 > 426	static void __exit phytium_display_exit(void)
   427	{
   428		pci_unregister_driver(&phytium_pci_driver);
   429	
   430		platform_driver_unregister(&phytium_platform_driver);
   431	}
   432	
 > 433	module_init(phytium_display_init);
   434	module_exit(phytium_display_exit);
   435	
 > 436	MODULE_LICENSE("GPL");
 > 437	MODULE_AUTHOR("Yang Xun <yangxun@phytium.com.cn>");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
