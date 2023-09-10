Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B63CC8488
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 Sep 2023 22:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694386775; x=1725922775;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1MdT0j3frEZg/TUUFPU0wOKp1Tn2f5lqsDpEQ+Kf+YA=;
  b=JdzPmJeAyoZ0TrB+EbTgu/EmEykMzhE8pZW534DpimBVFvruLeaU+gRa
   1TffzlVxsF7r0jFz4QNn8aloXDKZKT+M+072S4uMyYTtDmGKKHHISHdaT
   kGoGj07yYw05Szvx8wD0yzvaN0z//o+f2Uy2ohAASpcxaXAS1d1kteo/A
   ncwaHwUOPq59qIrn/3dbICg1ijY42UadGPCwgu15jzCRFkOpHOLhIZEuw
   FKoAr0bOQa6hPiLC1zGqKE0n9okJX/CDkxI59ZaeO6SmB3YXfJbyUNVYD
   FYNI8EsiyekIPg9F/ij6S3Vi1KKNmrIlK78TaPLAEVH5G0PjvbAtBbwBy
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="376837189"
X-IronPort-AV: E=Sophos;i="6.02,243,1688454000"; 
   d="scan'208";a="376837189"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2023 15:59:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="736569862"
X-IronPort-AV: E=Sophos;i="6.02,243,1688454000"; 
   d="scan'208";a="736569862"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 10 Sep 2023 15:59:32 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qfTOs-0005Wa-0G;
	Sun, 10 Sep 2023 22:59:30 +0000
Date: Mon, 11 Sep 2023 06:58:54 +0800
From: kernel test robot <lkp@intel.com>
To: Pei Zhang <pei.zhang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Pan, Kris" <kris.pan@intel.com>,
	"Jiang, Fei" <fei.jiang@intel.com>, "He, Min" <min.he@intel.com>,
	"Dong, Eddie" <eddie.dong@intel.com>
Subject: [intel-lts:4.19/android_t 3675/30000]
 drivers/gpu/drm/i915/i915_drv.c:996:43: sparse: sparse: incorrect type in
 argument 2 (different address spaces)
Message-ID: <202309110640.OZEsWbjr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 4.19/android_t
head:   247bc655e03e4ac3632b21081ca56b813a644dcf
commit: 3abfdfac8f8c0b356cd4b32e1287cc59062751a3 [3675/30000] drm/i915/gvt: add module parameter enable_pvmmio
config: x86_64-randconfig-121-20230910 (https://download.01.org/0day-ci/archive/20230911/202309110640.OZEsWbjr-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230911/202309110640.OZEsWbjr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309110640.OZEsWbjr-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/i915/i915_drv.c:996:43: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] <asn:2> * @@     got struct gvt_shared_page *shared_page @@
   drivers/gpu/drm/i915/i915_drv.c:996:43: sparse:     expected void [noderef] <asn:2> *
   drivers/gpu/drm/i915/i915_drv.c:996:43: sparse:     got struct gvt_shared_page *shared_page
>> drivers/gpu/drm/i915/i915_drv.c:1036:42: sparse: sparse: cast removes address space '<asn:2>' of expression
   drivers/gpu/drm/i915/i915_drv.c:1056:57: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] <asn:2> * @@     got struct gvt_shared_page *shared_page @@
   drivers/gpu/drm/i915/i915_drv.c:1056:57: sparse:     expected void [noderef] <asn:2> *
   drivers/gpu/drm/i915/i915_drv.c:1056:57: sparse:     got struct gvt_shared_page *shared_page
   drivers/gpu/drm/i915/i915_drv.o: warning: objtool: i915_getparam_ioctl()+0x56f: sibling call from callable instruction with modified stack frame
   drivers/gpu/drm/i915/i915_drv.o: warning: objtool: i915_mmio_cleanup()+0xe6: sibling call from callable instruction with modified stack frame
   drivers/gpu/drm/i915/i915_drv.o: warning: objtool: i915_driver_init_hw()+0x84: sibling call from callable instruction with modified stack frame
   drivers/gpu/drm/i915/i915_drv.o: warning: objtool: i915_driver_init_early()+0x80: sibling call from callable instruction with modified stack frame
   drivers/gpu/drm/i915/i915_drv.o: warning: objtool: i915_driver_init_mmio()+0x3b6: sibling call from callable instruction with modified stack frame
   drivers/gpu/drm/i915/i915_drv.o: warning: objtool: __i915_inject_load_failure()+0x51: sibling call from callable instruction with modified stack frame
   drivers/gpu/drm/i915/i915_drv.o: warning: objtool: __i915_printk()+0x22f: sibling call from callable instruction with modified stack frame
   drivers/gpu/drm/i915/i915_drv.o: warning: objtool: i915_driver_load()+0xa2: sibling call from callable instruction with modified stack frame
   drivers/gpu/drm/i915/i915_drv.o: warning: objtool: i915_reset()+0x362: sibling call from callable instruction with modified stack frame
   drivers/gpu/drm/i915/i915_drv.o: warning: objtool: i915_drm_resume_early()+0x1d2: sibling call from callable instruction with modified stack frame
   drivers/gpu/drm/i915/i915_drv.o: warning: objtool: intel_runtime_resume()+0x384: sibling call from callable instruction with modified stack frame
   drivers/gpu/drm/i915/i915_drv.o: warning: objtool: i915_drm_suspend_late()+0x2f3: sibling call from callable instruction with modified stack frame
   drivers/gpu/drm/i915/i915_drv.o: warning: objtool: intel_runtime_suspend()+0x6b: sibling call from callable instruction with modified stack frame

vim +996 drivers/gpu/drm/i915/i915_drv.c

   988	
   989	static void i915_mmio_cleanup(struct drm_i915_private *dev_priv)
   990	{
   991		struct pci_dev *pdev = dev_priv->drm.pdev;
   992	
   993		intel_teardown_mchbar(dev_priv);
   994		pci_iounmap(pdev, dev_priv->regs);
   995		if (intel_vgpu_active(dev_priv) && dev_priv->shared_page)
 > 996			pci_iounmap(pdev, dev_priv->shared_page);
   997	
   998	}
   999	
  1000	/**
  1001	 * i915_driver_init_mmio - setup device MMIO
  1002	 * @dev_priv: device private
  1003	 *
  1004	 * Setup minimal device state necessary for MMIO accesses later in the
  1005	 * initialization sequence. The setup here should avoid any other device-wide
  1006	 * side effects or exposing the driver via kernel internal or user space
  1007	 * interfaces.
  1008	 */
  1009	static int i915_driver_init_mmio(struct drm_i915_private *dev_priv)
  1010	{
  1011		int ret;
  1012	
  1013		if (i915_inject_load_failure())
  1014			return -ENODEV;
  1015	
  1016		if (i915_get_bridge_dev(dev_priv))
  1017			return -EIO;
  1018	
  1019		ret = i915_mmio_setup(dev_priv);
  1020		if (ret < 0)
  1021			goto err_bridge;
  1022	
  1023		intel_uncore_init(dev_priv);
  1024	
  1025		intel_device_info_init_mmio(dev_priv);
  1026	
  1027		intel_uncore_prune(dev_priv);
  1028	
  1029		intel_uc_init_mmio(dev_priv);
  1030	
  1031		if (intel_vgpu_active(dev_priv) && i915_modparams.enable_pvmmio) {
  1032			u32 bar = 0;
  1033			u32 mmio_size = 2 * 1024 * 1024;
  1034	
  1035			/* Map a share page from the end of 2M mmio region in bar0. */
> 1036			dev_priv->shared_page = (struct gvt_shared_page *)
  1037				pci_iomap_range(dev_priv->drm.pdev, bar,
  1038				mmio_size, PAGE_SIZE);
  1039			if (dev_priv->shared_page == NULL) {
  1040				ret = -EIO;
  1041				DRM_ERROR("ivi: failed to map share page.\n");
  1042				goto err_uncore;
  1043			}
  1044		}
  1045	
  1046		ret = intel_engines_init_mmio(dev_priv);
  1047		if (ret)
  1048			goto err_uncore;
  1049	
  1050		i915_gem_init_mmio(dev_priv);
  1051	
  1052		return 0;
  1053	
  1054	err_uncore:
  1055		if (intel_vgpu_active(dev_priv) && dev_priv->shared_page)
  1056			pci_iounmap(dev_priv->drm.pdev, dev_priv->shared_page);
  1057		intel_uncore_fini(dev_priv);
  1058	err_bridge:
  1059		pci_dev_put(dev_priv->bridge_dev);
  1060	
  1061		return ret;
  1062	}
  1063	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
