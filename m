Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 356EC1E3DEB
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Oct 2024 22:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728512732; cv=none; b=B30WD5ImLbXI1RFlEsUB85jgzxiikU9BGDjdkZ6VSLD/5DFuFAy6B0lbA28BAy6DNikai52EmfykNm+32/ZeBKVsZnClRAbxoLIS/1/SenjNe8q0tWM8KrzG3SbqYMYAhG3GrxCDmn2L7r85tkzgFzNUlhgXj6uge+ils1m4HVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728512732; c=relaxed/simple;
	bh=pagYQa10pmI1YhgBBeyK/fjEwNudKHPzwJ+scGzkakM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=arwBW+VUGlIvDQxlPCNcBEtk8bxEiJx1/KFQp2epU2c1wNQJxInrkoxNaD2XA3sHmJ+lgxedYBacxo92rPTF3rWWS5c/uCOTax58r5AK9zSKf7YFjefy4J8JJdwS/ESK7Y7+tcoqRcwTpDpX+6tupyHqgeJauEIX6xoG3NqANEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hxc+6BVe; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hxc+6BVe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728512730; x=1760048730;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pagYQa10pmI1YhgBBeyK/fjEwNudKHPzwJ+scGzkakM=;
  b=Hxc+6BVeH060QmQYVd/UR7rZ5TU1+VgzWI9O4K3IcWCBanXCbE0eUSon
   P23ft5Szq1IW1umgs2sx1AGUPWemmXYzJ5itPS11QBxH9WS1C3wa+4RlO
   nMTVti4vGpoji3KTLknog8eDfDMorWJ3MfByV35iaFgWsuNHrjgvOg9Go
   ewoJ7g4fPTdw8Y38cHgq2TqU4q7+RsccocgGinW2QOukLpvdy9mQDauXV
   liKA8pjVMGY/1H6NKf8Alk/ISNp21Ob20oCfd8H6F4TaZplLVVLH/+p43
   04qPLykdI/TvOyylK2hohVN8KKJju4oKMTgzriSWTaIp1CNVvneDtbeCr
   g==;
X-CSE-ConnectionGUID: zYajXbKCT3WLVl7Hxa/xvA==
X-CSE-MsgGUID: VtePfyvPQKyCgCKYM3lCoQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="50382749"
X-IronPort-AV: E=Sophos;i="6.11,191,1725346800"; 
   d="scan'208";a="50382749"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2024 15:25:27 -0700
X-CSE-ConnectionGUID: /GNf/hXYSt6opJpWYJLjig==
X-CSE-MsgGUID: 9ZI8ocehSuueMrSNI87evA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,191,1725346800"; 
   d="scan'208";a="80960448"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 09 Oct 2024 15:25:26 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1syf7T-0009sW-2R;
	Wed, 09 Oct 2024 22:25:23 +0000
Date: Thu, 10 Oct 2024 06:24:26 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, lishuo <lishuo@phytium.com.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 21254/23825]
 drivers/gpu/drm/phytium/phytium_pci.c:237:23: error: implicit declaration of
 function 'pci_enable_msi'; did you mean 'pci_enable_sriov'?
Message-ID: <202410100635.fEGuT7Zt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   bd281fec9a629fc56d2e07e32f8e719201dfc38f
commit: cad0702e5286d3cc80afe545de027858b855dd5a [21254/23825] DRM: Phytium display DRM driver
config: arm64-randconfig-002-20241010 (https://download.01.org/0day-ci/archive/20241010/202410100635.fEGuT7Zt-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241010/202410100635.fEGuT7Zt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410100635.fEGuT7Zt-lkp@intel.com/

All errors (new ones prefixed by >>):

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
   drivers/gpu/drm/phytium/phytium_pci.c: In function 'phytium_pci_probe':
>> drivers/gpu/drm/phytium/phytium_pci.c:237:23: error: implicit declaration of function 'pci_enable_msi'; did you mean 'pci_enable_sriov'? [-Werror=implicit-function-declaration]
     237 |                 ret = pci_enable_msi(pdev);
         |                       ^~~~~~~~~~~~~~
         |                       pci_enable_sriov
>> drivers/gpu/drm/phytium/phytium_pci.c:272:17: error: implicit declaration of function 'pci_disable_msi'; did you mean 'pci_disable_sriov'? [-Werror=implicit-function-declaration]
     272 |                 pci_disable_msi(pdev);
         |                 ^~~~~~~~~~~~~~~
         |                 pci_disable_sriov
   In file included from drivers/gpu/drm/phytium/phytium_pci.c:7:
   drivers/gpu/drm/phytium/phytium_pci.c: At top level:
   include/linux/pci.h:888:19: error: 'PCI_VENDOR_ID_PHYTIUM' undeclared here (not in a function); did you mean 'PCI_VENDOR_ID_PHILIPS'?
     888 |         .vendor = PCI_VENDOR_ID_##vend, .device = (dev), \
         |                   ^~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/phytium_pci.c:375:11: note: in expansion of macro 'PCI_VDEVICE'
     375 |         { PCI_VDEVICE(PHYTIUM, 0xdc22), (kernel_ulong_t)&x100_info },
         |           ^~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +237 drivers/gpu/drm/phytium/phytium_pci.c

    88	
    89	int phytium_pci_dma_init(struct phytium_display_private *priv)
    90	{
    91		struct pci_dev *dma_dev, *gpu_dev;
    92		struct drm_device *drm_dev =  priv->dev;
    93		dma_cap_mask_t mask;
    94		struct phytium_dma_slave s;
    95		int ret = 0;
    96		u16 cmd;
    97	
    98		/* check x100 gpu enable */
  > 99		gpu_dev = pci_get_device(PCI_VENDOR_ID_PHYTIUM, 0xdc20, NULL);
   100		if (!gpu_dev) {
   101			DRM_INFO("failed to get gpu_dev\n");
   102			ret = -ENODEV;
   103			goto failed;
   104		}
   105	
   106		pci_read_config_word(gpu_dev, PCI_COMMAND, &cmd);
   107		if (!(cmd & PCI_COMMAND_MASTER)) {
   108			DRM_INFO("gpu_dev master is disabled\n");
   109			ret = -ENODEV;
   110			goto failed;
   111		}
   112	
   113		dma_dev = pci_get_device(PCI_VENDOR_ID_PHYTIUM, 0xdc3c, NULL);
   114		if (!dma_dev) {
   115			DRM_INFO("failed to get dma_dev\n");
   116			ret = -ENODEV;
   117			goto failed;
   118		}
   119	
   120		dma_cap_zero(mask);
   121		dma_cap_set(DMA_SLAVE, mask);
   122	
   123		s.dma_dev = &dma_dev->dev;
   124		s.chan_id = 2;
   125		priv->dma_chan = dma_request_channel(mask, phytium_pci_dma_chan_filter, &s);
   126		if (!priv->dma_chan) {
   127			DRM_DEV_ERROR(drm_dev->dev, "failed to request dma chan\n");
   128			ret = -EBUSY;
   129			goto failed;
   130		}
   131		priv->dma_inited = 1;
   132	
   133	failed:
   134		return ret;
   135	}
   136	
 > 137	void phytium_pci_dma_fini(struct phytium_display_private *priv)
   138	{
   139		if (priv->dma_inited)
   140			dma_release_channel(priv->dma_chan);
   141		priv->dma_inited = 0;
   142		priv->dma_chan =  NULL;
   143	}
   144	
   145	static struct phytium_display_private*
   146	phytium_pci_private_init(struct pci_dev *pdev, const struct pci_device_id *ent)
   147	{
   148		struct drm_device *dev = pci_get_drvdata(pdev);
   149		struct phytium_display_private *priv = NULL;
   150		struct phytium_pci_private *pci_priv = NULL;
   151		struct phytium_device_info *phytium_info = (struct phytium_device_info *)ent->driver_data;
   152		int i = 0;
   153		resource_size_t io_addr, io_size;
   154	
   155		pci_priv = devm_kzalloc(&pdev->dev, sizeof(*pci_priv), GFP_KERNEL);
   156		if (!pci_priv) {
   157			DRM_ERROR("no memory to allocate for drm_display_private\n");
   158			goto failed_malloc_priv;
   159		}
   160	
   161		memset(pci_priv, 0, sizeof(*pci_priv));
   162		priv = &pci_priv->base;
   163		phytium_display_private_init(priv, dev);
   164	
   165		memcpy(&(priv->info), phytium_info, sizeof(struct phytium_device_info));
   166		DRM_DEBUG_KMS("priv->info.num_pipes :%d\n", priv->info.num_pipes);
   167		priv->info.pipe_mask = ((pdev->subsystem_device >> PIPE_MASK_SHIFT) & PIPE_MASK_MASK);
   168		priv->info.edp_mask = ((pdev->subsystem_device >> EDP_MASK_SHIFT) & EDP_MASK_MASK);
   169		priv->info.num_pipes = 0;
   170		for_each_pipe_masked(priv, i)
   171			priv->info.num_pipes++;
   172		if (priv->info.num_pipes == 0) {
   173			DRM_ERROR("num_pipes is zero, so exit init\n");
   174			goto failed_init_numpipe;
   175		}
   176	
   177		io_addr = pci_resource_start(pdev, 0);
   178		io_size = pci_resource_len(pdev, 0);
   179		priv->regs = ioremap(io_addr, io_size);
   180		if (priv->regs == NULL) {
   181			DRM_ERROR("pci bar0 ioremap fail, addr:0x%llx, size:0x%llx\n", io_addr, io_size);
   182			goto failed_ioremap;
   183		}
   184	
   185		priv->irq = pdev->irq;
   186		if (IS_X100(priv)) {
   187			pci_priv->dc_hw_vram_init = x100_dc_hw_vram_init;
   188			priv->dc_hw_clear_msi_irq = x100_dc_hw_clear_msi_irq;
   189			priv->dc_hw_fb_format_check = x100_dc_hw_fb_format_check;
   190		} else if (IS_E2000(priv)) {
   191			pci_priv->dc_hw_vram_init = e2000_dc_hw_vram_init;
   192			priv->dc_hw_clear_msi_irq = NULL;
   193			priv->dc_hw_fb_format_check = e2000_dc_hw_fb_format_check;
   194		}
   195	
   196		return priv;
   197	
   198	failed_ioremap:
   199	failed_init_numpipe:
   200		devm_kfree(&pdev->dev, pci_priv);
   201	failed_malloc_priv:
   202		return NULL;
   203	}
   204	
   205	static void
   206	phytium_pci_private_fini(struct pci_dev *pdev, struct phytium_display_private *priv)
   207	{
   208		struct phytium_pci_private *pci_priv = to_pci_priv(priv);
   209	
   210		if (priv->regs)
   211			iounmap(priv->regs);
   212	
   213		devm_kfree(&pdev->dev, pci_priv);
   214	}
   215	
   216	static int phytium_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
   217	{
   218		struct phytium_display_private *priv = NULL;
   219		struct drm_device *dev = NULL;
   220		int ret = 0;
   221	
   222		dev = drm_dev_alloc(&phytium_display_drm_driver, &pdev->dev);
   223		if (IS_ERR(dev)) {
   224			DRM_ERROR("failed to allocate drm_device\n");
   225			return PTR_ERR(dev);
   226		}
   227		dev->pdev = pdev;
   228		pci_set_drvdata(pdev, dev);
   229		pci_set_master(pdev);
   230		ret = pci_enable_device(pdev);
   231		if (ret) {
   232			DRM_ERROR("pci enbale device fail\n");
   233			goto failed_enable_device;
   234		}
   235	
   236		if (dc_msi_enable) {
 > 237			ret = pci_enable_msi(pdev);
   238			if (ret)
   239				DRM_ERROR("pci enbale msi fail\n");
   240		}
   241	
   242		dma_set_mask(&pdev->dev, DMA_BIT_MASK(40));
   243	
   244		priv = phytium_pci_private_init(pdev, ent);
   245		if (priv)
   246			dev->dev_private = priv;
   247		else
   248			goto failed_pci_private_init;
   249	
   250		ret = phytium_pci_vram_init(pdev, priv);
   251		if (ret) {
   252			DRM_ERROR("failed to init pci vram\n");
   253			goto failed_pci_vram_init;
   254		}
   255	
   256		ret = drm_dev_register(dev, 0);
   257		if (ret) {
   258			DRM_ERROR("failed to register drm dev\n");
   259			goto failed_register_drm;
   260		}
   261	
   262		phytium_dp_hpd_irq_setup(dev, true);
   263	
   264		return 0;
   265	
   266	failed_register_drm:
   267		phytium_pci_vram_fini(pdev, priv);
   268	failed_pci_vram_init:
   269		phytium_pci_private_fini(pdev, priv);
   270	failed_pci_private_init:
   271		if (pdev->msi_enabled)
 > 272			pci_disable_msi(pdev);
   273		pci_disable_device(pdev);
   274	failed_enable_device:
   275		pci_set_drvdata(pdev, NULL);
   276		drm_dev_put(dev);
   277	
   278		return -1;
   279	}
   280	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
