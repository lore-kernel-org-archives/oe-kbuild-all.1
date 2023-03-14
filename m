Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 292AE28EF
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Mar 2023 08:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678783947; x=1710319947;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7wfTUUQBo4q6tPItku8Fgbsdoen8/cQ7rOQLQtGn10s=;
  b=evWCQv8TDbxnYb7bgJF2NDqmGYRlH0sLH/DuG77zKYEPDjjg9Gbggqpo
   Fo6Tb3PgcFa0G3LS3S46wyY/5VkI/0UTtqXJQ7Vo1+ZZHwF+sOlMjbGuf
   NP6/9J9/OLS79jFWY3jgOrALm8KxZ+Wb+cCrYeg/2HJWNjXSHhAKTfzFH
   giSVvjCC4IQtwYMwqRykb478RFuqd1L6F4qOmEMScWkGGvtYSlikF2NAQ
   VOm+ibGo9jOvRorcJvB3cIDWEeGnTSx2z+SE5cbQnG1g1hGH8PF0jnCmL
   riPRSOELcgVIgLp6HgNiU3HwiSeukgTSXSuOL/x5Vl30u9zwm7mUd3PY5
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="337392535"
X-IronPort-AV: E=Sophos;i="5.98,259,1673942400"; 
   d="scan'208";a="337392535"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2023 01:52:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="853098950"
X-IronPort-AV: E=Sophos;i="5.98,259,1673942400"; 
   d="scan'208";a="853098950"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 14 Mar 2023 01:52:25 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pc0OO-0006im-1Q;
	Tue, 14 Mar 2023 08:52:24 +0000
Date: Tue, 14 Mar 2023 16:52:07 +0800
From: kernel test robot <lkp@intel.com>
To: Imre Deak <imre.deak@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Jani Nikula <jani.nikula@intel.com>
Subject: [linux-next:master 2536/3406]
 drivers/gpu/drm/i915/i915_driver.c:556:9: error: implicit declaration of
 function 'intel_opregion_cleanup'; did you mean 'intel_opregion_setup'?
Message-ID: <202303141610.6L1VO7Gw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ec0fa9a0a6fac454745c930bdb8619d0a354bac9
commit: 3e226e4a21808e4582020f813b041504f316022f [2536/3406] drm/i915/opregion: Cleanup opregion after errors during driver loading
config: i386-buildonly-randconfig-r006-20230313 (https://download.01.org/0day-ci/archive/20230314/202303141610.6L1VO7Gw-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=3e226e4a21808e4582020f813b041504f316022f
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 3e226e4a21808e4582020f813b041504f316022f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpu/drm/i915/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303141610.6L1VO7Gw-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/i915/i915_driver.c: In function 'i915_driver_hw_probe':
>> drivers/gpu/drm/i915/i915_driver.c:556:9: error: implicit declaration of function 'intel_opregion_cleanup'; did you mean 'intel_opregion_setup'? [-Werror=implicit-function-declaration]
     556 |         intel_opregion_cleanup(dev_priv);
         |         ^~~~~~~~~~~~~~~~~~~~~~
         |         intel_opregion_setup
   cc1: some warnings being treated as errors


vim +556 drivers/gpu/drm/i915/i915_driver.c

   425	
   426	/**
   427	 * i915_driver_hw_probe - setup state requiring device access
   428	 * @dev_priv: device private
   429	 *
   430	 * Setup state that requires accessing the device, but doesn't require
   431	 * exposing the driver via kernel internal or userspace interfaces.
   432	 */
   433	static int i915_driver_hw_probe(struct drm_i915_private *dev_priv)
   434	{
   435		struct pci_dev *pdev = to_pci_dev(dev_priv->drm.dev);
   436		struct pci_dev *root_pdev;
   437		int ret;
   438	
   439		if (i915_inject_probe_failure(dev_priv))
   440			return -ENODEV;
   441	
   442		if (HAS_PPGTT(dev_priv)) {
   443			if (intel_vgpu_active(dev_priv) &&
   444			    !intel_vgpu_has_full_ppgtt(dev_priv)) {
   445				i915_report_error(dev_priv,
   446						  "incompatible vGPU found, support for isolated ppGTT required\n");
   447				return -ENXIO;
   448			}
   449		}
   450	
   451		if (HAS_EXECLISTS(dev_priv)) {
   452			/*
   453			 * Older GVT emulation depends upon intercepting CSB mmio,
   454			 * which we no longer use, preferring to use the HWSP cache
   455			 * instead.
   456			 */
   457			if (intel_vgpu_active(dev_priv) &&
   458			    !intel_vgpu_has_hwsp_emulation(dev_priv)) {
   459				i915_report_error(dev_priv,
   460						  "old vGPU host found, support for HWSP emulation required\n");
   461				return -ENXIO;
   462			}
   463		}
   464	
   465		/* needs to be done before ggtt probe */
   466		intel_dram_edram_detect(dev_priv);
   467	
   468		ret = i915_set_dma_info(dev_priv);
   469		if (ret)
   470			return ret;
   471	
   472		i915_perf_init(dev_priv);
   473	
   474		ret = i915_ggtt_probe_hw(dev_priv);
   475		if (ret)
   476			goto err_perf;
   477	
   478		ret = drm_aperture_remove_conflicting_pci_framebuffers(pdev, dev_priv->drm.driver);
   479		if (ret)
   480			goto err_ggtt;
   481	
   482		ret = i915_ggtt_init_hw(dev_priv);
   483		if (ret)
   484			goto err_ggtt;
   485	
   486		ret = intel_memory_regions_hw_probe(dev_priv);
   487		if (ret)
   488			goto err_ggtt;
   489	
   490		ret = intel_gt_tiles_init(dev_priv);
   491		if (ret)
   492			goto err_mem_regions;
   493	
   494		ret = i915_ggtt_enable_hw(dev_priv);
   495		if (ret) {
   496			drm_err(&dev_priv->drm, "failed to enable GGTT\n");
   497			goto err_mem_regions;
   498		}
   499	
   500		pci_set_master(pdev);
   501	
   502		/* On the 945G/GM, the chipset reports the MSI capability on the
   503		 * integrated graphics even though the support isn't actually there
   504		 * according to the published specs.  It doesn't appear to function
   505		 * correctly in testing on 945G.
   506		 * This may be a side effect of MSI having been made available for PEG
   507		 * and the registers being closely associated.
   508		 *
   509		 * According to chipset errata, on the 965GM, MSI interrupts may
   510		 * be lost or delayed, and was defeatured. MSI interrupts seem to
   511		 * get lost on g4x as well, and interrupt delivery seems to stay
   512		 * properly dead afterwards. So we'll just disable them for all
   513		 * pre-gen5 chipsets.
   514		 *
   515		 * dp aux and gmbus irq on gen4 seems to be able to generate legacy
   516		 * interrupts even when in MSI mode. This results in spurious
   517		 * interrupt warnings if the legacy irq no. is shared with another
   518		 * device. The kernel then disables that interrupt source and so
   519		 * prevents the other device from working properly.
   520		 */
   521		if (GRAPHICS_VER(dev_priv) >= 5) {
   522			if (pci_enable_msi(pdev) < 0)
   523				drm_dbg(&dev_priv->drm, "can't enable MSI");
   524		}
   525	
   526		ret = intel_gvt_init(dev_priv);
   527		if (ret)
   528			goto err_msi;
   529	
   530		intel_opregion_setup(dev_priv);
   531	
   532		ret = i915_pcode_init(dev_priv);
   533		if (ret)
   534			goto err_opregion;
   535	
   536		/*
   537		 * Fill the dram structure to get the system dram info. This will be
   538		 * used for memory latency calculation.
   539		 */
   540		intel_dram_detect(dev_priv);
   541	
   542		intel_bw_init_hw(dev_priv);
   543	
   544		/*
   545		 * FIXME: Temporary hammer to avoid freezing the machine on our DGFX
   546		 * This should be totally removed when we handle the pci states properly
   547		 * on runtime PM and on s2idle cases.
   548		 */
   549		root_pdev = pcie_find_root_port(pdev);
   550		if (root_pdev)
   551			pci_d3cold_disable(root_pdev);
   552	
   553		return 0;
   554	
   555	err_opregion:
 > 556		intel_opregion_cleanup(dev_priv);
   557	err_msi:
   558		if (pdev->msi_enabled)
   559			pci_disable_msi(pdev);
   560	err_mem_regions:
   561		intel_memory_regions_driver_release(dev_priv);
   562	err_ggtt:
   563		i915_ggtt_driver_release(dev_priv);
   564		i915_gem_drain_freed_objects(dev_priv);
   565		i915_ggtt_driver_late_release(dev_priv);
   566	err_perf:
   567		i915_perf_fini(dev_priv);
   568		return ret;
   569	}
   570	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
