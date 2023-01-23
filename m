Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC127C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Jan 2023 19:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674501143; x=1706037143;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sLtD0mMwJmm2qsIHDW/glYlnpjBqkPmHOytKwFXJcdQ=;
  b=BgXCAHOeg7cbX+VL/jzzIxjGuT+iZ0Lbgr07dl46QhPUxGRqcmHiEm9U
   y/Bkx1M9xLesAOgnhUKcCWPcfW+Jh1otEr+GfHu8Ni8MVFA9Ba2oUrd2I
   30PXYtqSk1da5A68NSGQhww2CEvifvxMoRxKBc5eIHEZxRGPdYW4CnRQQ
   tzlmuxDI8vav/qgoft0GnMrof6SwDqF1FNDo4vG6VfysUQNtLWHnX+dsa
   urTOjpxSmenr5FJmK1EKJZjNNej/cVAkq6VgCA9FtV/WjF3oHnspfSNCm
   RgP9VJSxCMBo0J5ct3dF/UXklsjhnjzw2m8vbGiK93dDlPeyv9WxdIQp3
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="323817883"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; 
   d="scan'208";a="323817883"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2023 11:12:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="639308024"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; 
   d="scan'208";a="639308024"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 23 Jan 2023 11:12:19 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pK2Es-0005qB-1l;
	Mon, 23 Jan 2023 19:12:18 +0000
Date: Tue, 24 Jan 2023 03:12:10 +0800
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: oe-kbuild-all@lists.linux.dev, Hector Martin <marcan@marcan.st>
Subject: [asahilinux:bits/200-dcp 90/91] drivers/gpu/drm/apple/dcp.c:526:17:
 error: implicit declaration of function 'devm_apple_rtkit_free'; did you
 mean 'devm_apple_rtkit_init'?
Message-ID: <202301240356.DxHN10l6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/200-dcp
head:   a2482bcc061b8b8143649c24162ebcaed9af3102
commit: db981af1f9501e533d9bb90a1a35dce5a08be857 [90/91] drm/apple: Support DCP shutdown and restart
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230124/202301240356.DxHN10l6-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/AsahiLinux/linux/commit/db981af1f9501e533d9bb90a1a35dce5a08be857
        git remote add asahilinux https://github.com/AsahiLinux/linux
        git fetch --no-tags asahilinux bits/200-dcp
        git checkout db981af1f9501e533d9bb90a1a35dce5a08be857
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/gpu/drm/apple/dcp.c: In function 'dcp_crtc_atomic_check':
   drivers/gpu/drm/apple/dcp.c:198:45: warning: variable 'old_state' set but not used [-Wunused-but-set-variable]
     198 |         struct drm_plane_state *new_state, *old_state;
         |                                             ^~~~~~~~~
   drivers/gpu/drm/apple/dcp.c: In function 'dcp_comp_bind':
>> drivers/gpu/drm/apple/dcp.c:526:17: error: implicit declaration of function 'devm_apple_rtkit_free'; did you mean 'devm_apple_rtkit_init'? [-Werror=implicit-function-declaration]
     526 |                 devm_apple_rtkit_free(dev, dcp->rtk);
         |                 ^~~~~~~~~~~~~~~~~~~~~
         |                 devm_apple_rtkit_init
   drivers/gpu/drm/apple/dcp.c: In function 'dcp_runtime_suspend':
   drivers/gpu/drm/apple/dcp.c:652:23: error: implicit declaration of function 'apple_rtkit_idle'; did you mean 'apple_rtkit_poll'? [-Werror=implicit-function-declaration]
     652 |                 ret = apple_rtkit_idle(dcp->rtk);
         |                       ^~~~~~~~~~~~~~~~
         |                       apple_rtkit_poll
   cc1: some warnings being treated as errors


vim +526 drivers/gpu/drm/apple/dcp.c

   411	
   412	static int dcp_comp_bind(struct device *dev, struct device *main, void *data)
   413	{
   414		struct device_node *panel_np;
   415		struct apple_dcp *dcp = dev_get_drvdata(dev);
   416		int ret;
   417	
   418		ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(36));
   419		if (ret)
   420			return ret;
   421	
   422		dcp->coproc_reg = devm_platform_ioremap_resource_byname(to_platform_device(dev), "coproc");
   423		if (IS_ERR(dcp->coproc_reg))
   424			return PTR_ERR(dcp->coproc_reg);
   425	
   426		dcp->reset = devm_reset_control_array_get_exclusive(dev);
   427		if (IS_ERR(dcp->reset)) {
   428			return dev_err_probe(dev, PTR_ERR(dcp->reset),
   429					     "Failed to get reset control");
   430		}
   431	
   432		if (!show_notch)
   433			ret = of_property_read_u32(dev->of_node, "apple,notch-height",
   434						   &dcp->notch_height);
   435	
   436		if (dcp->notch_height > MAX_NOTCH_HEIGHT)
   437			dcp->notch_height = MAX_NOTCH_HEIGHT;
   438		if (dcp->notch_height > 0)
   439			dev_info(dev, "Detected display with notch of %u pixel\n", dcp->notch_height);
   440	
   441		/* intialize brightness scale to a sensible default to avoid divide by 0*/
   442		dcp->brightness.scale = 65536;
   443		panel_np = of_get_compatible_child(dev->of_node, "apple,panel-mini-led");
   444		if (panel_np)
   445			dcp->has_mini_led = true;
   446		else
   447			panel_np = of_get_compatible_child(dev->of_node, "apple,panel");
   448	
   449		if (panel_np) {
   450			const char height_prop[2][16] = { "adj-height-mm", "height-mm" };
   451	
   452			if (of_device_is_available(panel_np)) {
   453				ret = of_property_read_u32(panel_np, "apple,max-brightness",
   454							   &dcp->brightness.maximum);
   455				if (ret)
   456					dev_err(dev, "Missing property 'apple,max-brightness'\n");
   457			}
   458	
   459			of_property_read_u32(panel_np, "width-mm", &dcp->width_mm);
   460			/* use adjusted height as long as the notch is hidden */
   461			of_property_read_u32(panel_np, height_prop[!dcp->notch_height],
   462					     &dcp->height_mm);
   463	
   464			of_node_put(panel_np);
   465			dcp->connector_type = DRM_MODE_CONNECTOR_eDP;
   466			INIT_WORK(&dcp->bl_register_wq, dcp_work_register_backlight);
   467			mutex_init(&dcp->bl_register_mutex);
   468		} else if (of_property_match_string(dev->of_node, "apple,connector-type", "HDMI-A") >= 0)
   469			dcp->connector_type = DRM_MODE_CONNECTOR_HDMIA;
   470		else if (of_property_match_string(dev->of_node, "apple,connector-type", "USB-C") >= 0)
   471			dcp->connector_type = DRM_MODE_CONNECTOR_USB;
   472		else
   473			dcp->connector_type = DRM_MODE_CONNECTOR_Unknown;
   474	
   475		/*
   476		 * Components do not ensure the bind order of sub components but
   477		 * the piodma device is only used for its iommu. The iommu is fully
   478		 * initialized by the time dcp_piodma_probe() calls component_add().
   479		 */
   480		dcp->piodma = dcp_get_dev(dev, "apple,piodma-mapper");
   481		if (!dcp->piodma) {
   482			dev_err(dev, "failed to find piodma\n");
   483			return -ENODEV;
   484		}
   485	
   486		ret = dcp_get_disp_regs(dcp);
   487		if (ret) {
   488			dev_err(dev, "failed to find display registers\n");
   489			return ret;
   490		}
   491	
   492		dcp->clk = devm_clk_get(dev, NULL);
   493		if (IS_ERR(dcp->clk))
   494			return dev_err_probe(dev, PTR_ERR(dcp->clk),
   495					     "Unable to find clock\n");
   496	
   497		ret = of_property_read_u64(dev->of_node, "apple,asc-dram-mask",
   498					   &dcp->asc_dram_mask);
   499		if (ret)
   500			dev_warn(dev, "failed read 'apple,asc-dram-mask': %d\n", ret);
   501		dev_dbg(dev, "'apple,asc-dram-mask': 0x%011llx\n", dcp->asc_dram_mask);
   502	
   503		bitmap_zero(dcp->memdesc_map, DCP_MAX_MAPPINGS);
   504		// TDOD: mem_desc IDs start at 1, for simplicity just skip '0' entry
   505		set_bit(0, dcp->memdesc_map);
   506	
   507		INIT_WORK(&dcp->vblank_wq, dcp_delayed_vblank);
   508	
   509		dcp->swapped_out_fbs =
   510			(struct list_head)LIST_HEAD_INIT(dcp->swapped_out_fbs);
   511	
   512		dcp->rtk = devm_apple_rtkit_init(dev, dcp, "mbox", 0, &rtkit_ops);
   513		if (IS_ERR(dcp->rtk))
   514			return dev_err_probe(dev, PTR_ERR(dcp->rtk),
   515					     "Failed to intialize RTKit");
   516	
   517		/* calling pm_runtime_force_resume() is equivalent to pm_runtime_enable
   518		 * if pm_runtime_force_suspend was not previously called
   519		 */
   520		ret = pm_runtime_force_resume(dev);
   521		if (ret)
   522			dev_err_probe(dev, ret, "pm_runtime_force_resume failed!\n");
   523	
   524		ret = pm_runtime_resume_and_get(dev);
   525		if (ret) {
 > 526			devm_apple_rtkit_free(dev, dcp->rtk);
   527			dcp->rtk = NULL;
   528			return dev_err_probe(dev, ret, "pm_runtime_resume_and_get failed!\n");
   529		}
   530	
   531		pm_runtime_set_autosuspend_delay(dev, 50);
   532		pm_runtime_use_autosuspend(dev);
   533	
   534		/*
   535		 * On probe, DCP is probably in charge of the boot framebuffer.
   536		 * Don't suspend it until we get an explicit poweroff request.
   537		 */
   538		dcp->awake = true;
   539	
   540		/* We are now a client of the DCP/DISP0 genpd, so we can remove the always on flag */
   541		if (dev->pm_domain) {
   542			struct generic_pm_domain *genpd = pd_to_genpd(dev->pm_domain);
   543			genpd->flags &= ~GENPD_FLAG_ALWAYS_ON;
   544		}
   545	
   546		return ret;
   547	}
   548	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
