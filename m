Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE8117FAD9
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 May 2024 19:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717183022; cv=none; b=ATi5EbkwTnR//QhqOEF8UzJaYawhEdufBqHPXuQXXo+JolTVKwm+sR8RkSsuajbj9oLf2T7jP2pp2RyRvV84sCzDpDNDPCXujgzYTWK9oewINajOnjqDjC0KCzZVJTmurr+cbDVO8fouk6Jhi1h0uQHR97lxTZzvYtBzGoIkz3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717183022; c=relaxed/simple;
	bh=X2jDRBH0jWsuQjeTXVC0fBSOVzbmZsibY6RFzlfB4bE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=La2cI5KhqPVf2R9/M8XwzoXP2S8OLlzZZELgnB8Rajyb43B+8yv7PZOe392aNTmMQKyxFt8qmBsu+TPZXA2F8hpjIMJtPo8A3juL8IRGE5YrWU1M1ty+Y4DQJTYHs0V3msB45iAZxeCLoFTqqp7cfk5EyNbOicbPaA2E8/af+XE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RI38fHzN; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RI38fHzN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717183020; x=1748719020;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=X2jDRBH0jWsuQjeTXVC0fBSOVzbmZsibY6RFzlfB4bE=;
  b=RI38fHzN9jB27+KBJVQmFt3Eg+0o0yJGuvF5C15i7YzmF0P/4AhgdV1F
   rQbag8G1ogr89Q8TJF+6Hy+WaUdYaH9XkA1dkegqzfKK180231kOfQClm
   QW1dp+ebW38b+/5KGAD0RTQuVd2e+IQqKLaVszs06gS6+v25bVKlLddMC
   L38P/cV47AZXZPxKuP6cBBHL6M8Swj9IAdfxl0txqQ7lsn19ojddYRI/A
   Y2r5kHyheN8zDzc3ZSw2Ag/+1X7McZqSXy3n0OQt7zoE/hiOZ7GdXVvYd
   RBk9ehQscIl9k9WYdjosruIbj1S2Nw754r7XD03ArLl0xWfvd0FDaRxoq
   Q==;
X-CSE-ConnectionGUID: kkfzX5KxS9CRgDg98gFXeQ==
X-CSE-MsgGUID: ioeTJ3f3Tym6ycKLJ4/Ilg==
X-IronPort-AV: E=McAfee;i="6600,9927,11089"; a="13610932"
X-IronPort-AV: E=Sophos;i="6.08,205,1712646000"; 
   d="scan'208";a="13610932"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2024 12:17:00 -0700
X-CSE-ConnectionGUID: Ku4s34a8RQu15DWEvbZebQ==
X-CSE-MsgGUID: /mAGnsX9QrO+ugtJQYh/tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,205,1712646000"; 
   d="scan'208";a="40692455"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 31 May 2024 12:16:56 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sD7kE-000Hhr-1t;
	Fri, 31 May 2024 19:16:54 +0000
Date: Sat, 1 Jun 2024 03:16:35 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 6401/7763]
 drivers/gpu/drm/phytium/phytium_pci.c:236:23: error: implicit declaration of
 function 'pci_enable_msi'; did you mean 'pci_enable_sriov'?
Message-ID: <202406010335.ldAk8MZX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   f449b1e5633624efc50445b2d2727cfc94fed27a
commit: 807eac186dc0a08a5518365494d4a216383909aa [6401/7763] DRM: Phytium display DRM driver
config: arm64-randconfig-004-20240601 (https://download.01.org/0day-ci/archive/20240601/202406010335.ldAk8MZX-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240601/202406010335.ldAk8MZX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406010335.ldAk8MZX-lkp@intel.com/

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
   drivers/gpu/drm/phytium/phytium_pci.c:137:6: warning: no previous prototype for 'phytium_pci_dma_fini' [-Wmissing-prototypes]
     137 | void phytium_pci_dma_fini(struct phytium_display_private *priv)
         |      ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/phytium_pci.c: In function 'phytium_pci_probe':
>> drivers/gpu/drm/phytium/phytium_pci.c:236:23: error: implicit declaration of function 'pci_enable_msi'; did you mean 'pci_enable_sriov'? [-Werror=implicit-function-declaration]
     236 |                 ret = pci_enable_msi(pdev);
         |                       ^~~~~~~~~~~~~~
         |                       pci_enable_sriov
>> drivers/gpu/drm/phytium/phytium_pci.c:271:17: error: implicit declaration of function 'pci_disable_msi'; did you mean 'pci_disable_sriov'? [-Werror=implicit-function-declaration]
     271 |                 pci_disable_msi(pdev);
         |                 ^~~~~~~~~~~~~~~
         |                 pci_disable_sriov
   cc1: some warnings being treated as errors


vim +236 drivers/gpu/drm/phytium/phytium_pci.c

    88	
  > 89	int phytium_pci_dma_init(struct phytium_display_private *priv)
    90	{
    91		struct pci_dev *dma_dev, *gpu_dev;
    92		struct drm_device *drm_dev =  priv->dev;
    93		dma_cap_mask_t mask;
    94		struct phytium_dma_slave s;
    95		int ret = 0;
    96		u16 cmd;
    97	
    98		/* check px210 gpu enable */
    99		gpu_dev = pci_get_device(PCI_VENDOR_ID_PHYTIUM, 0xdc20, NULL);
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
   186		if (IS_PX210(priv)) {
   187			pci_priv->dc_hw_vram_init = px210_dc_hw_vram_init;
   188			priv->dc_hw_clear_msi_irq = px210_dc_hw_clear_msi_irq;
   189			priv->dc_hw_fb_format_check = px210_dc_hw_fb_format_check;
   190		} else if (IS_PE220X(priv)) {
   191			pci_priv->dc_hw_vram_init = pe220x_dc_hw_vram_init;
   192			priv->dc_hw_clear_msi_irq = NULL;
   193			priv->dc_hw_fb_format_check = pe220x_dc_hw_fb_format_check;
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
   227		pci_set_drvdata(pdev, dev);
   228		pci_set_master(pdev);
   229		ret = pci_enable_device(pdev);
   230		if (ret) {
   231			DRM_ERROR("pci enable device fail\n");
   232			goto failed_enable_device;
   233		}
   234	
   235		if (dc_msi_enable) {
 > 236			ret = pci_enable_msi(pdev);
   237			if (ret)
   238				DRM_ERROR("pci enable msi fail\n");
   239		}
   240	
   241		dma_set_mask(&pdev->dev, DMA_BIT_MASK(40));
   242	
   243		priv = phytium_pci_private_init(pdev, ent);
   244		if (priv)
   245			dev->dev_private = priv;
   246		else
   247			goto failed_pci_private_init;
   248	
   249		ret = phytium_pci_vram_init(pdev, priv);
   250		if (ret) {
   251			DRM_ERROR("failed to init pci vram\n");
   252			goto failed_pci_vram_init;
   253		}
   254	
   255		ret = drm_dev_register(dev, 0);
   256		if (ret) {
   257			DRM_ERROR("failed to register drm dev\n");
   258			goto failed_register_drm;
   259		}
   260	
   261		phytium_dp_hpd_irq_setup(dev, true);
   262	
   263		return 0;
   264	
   265	failed_register_drm:
   266		phytium_pci_vram_fini(pdev, priv);
   267	failed_pci_vram_init:
   268		phytium_pci_private_fini(pdev, priv);
   269	failed_pci_private_init:
   270		if (pdev->msi_enabled)
 > 271			pci_disable_msi(pdev);
   272		pci_disable_device(pdev);
   273	failed_enable_device:
   274		pci_set_drvdata(pdev, NULL);
   275		drm_dev_put(dev);
   276	
   277		return -1;
   278	}
   279	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
