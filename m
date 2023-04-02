Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B67015A5
	for <oe-kbuild-all@lists.linux.dev>; Sun,  2 Apr 2023 04:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680410750; x=1711946750;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QLTico49dqwM4hpfjcPx1781/B7B3Wzbrcl+8fCb3DM=;
  b=OZBq/irx+1FkOOCyBYrU3mk3yqtu0bUk+cNzYcg31hWBFpiL1QCQc7XO
   I0LYfqZJd70SnI6pJNb5TtAY4pkS6qf9qg49NDqnMCF6SHt/IqNOZqn1s
   mnoDSwjG3tVMdXSwPWQ8RyvvfdxABt7DNWCrvRRvZOJUjTzEyY7twfVvA
   aTGcUwjN3ht3Rb2tUYXBt47vhb3m17JJUH1+3jevZvsLmInciwPapAM6+
   lwM7cCeutNs4pJJ4Dv9CJxXACWUc67dOStdnXoSxb9Acgzs/w68nApyyb
   DT+wAt8uFrh8wBIXQADNIHNLHcZfZhm2xNNhGEFJrdM20V799pEsdqOPQ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10667"; a="427986978"
X-IronPort-AV: E=Sophos;i="5.98,312,1673942400"; 
   d="scan'208";a="427986978"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2023 21:45:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10667"; a="1015299156"
X-IronPort-AV: E=Sophos;i="5.98,312,1673942400"; 
   d="scan'208";a="1015299156"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 01 Apr 2023 21:45:48 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pipbA-000NET-0R;
	Sun, 02 Apr 2023 04:45:48 +0000
Date: Sun, 2 Apr 2023 12:44:48 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-4.19 52/68]
 drivers/gpu/drm/meson/meson_drv.c:313:17: error: 'struct meson_drm' has no
 member named 'afbcd'
Message-ID: <202304021243.jgE8Ikm2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-4.19
head:   a30baeac2aea4a90f29ea39381f199fe3c90836e
commit: a949fa17a9b793fbb5725e6590a168aa4e304eaf [52/68] drm/meson: Fix error handling when afbcd.ops->init fails
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20230402/202304021243.jgE8Ikm2-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git/commit/?id=a949fa17a9b793fbb5725e6590a168aa4e304eaf
        git remote add sashal-stable https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git
        git fetch --no-tags sashal-stable pending-4.19
        git checkout a949fa17a9b793fbb5725e6590a168aa4e304eaf
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/gpu/drm/meson/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304021243.jgE8Ikm2-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/meson/meson_drv.c: In function 'meson_drv_bind_master':
>> drivers/gpu/drm/meson/meson_drv.c:313:17: error: 'struct meson_drm' has no member named 'afbcd'
     313 |         if (priv->afbcd.ops)
         |                 ^~
   drivers/gpu/drm/meson/meson_drv.c:314:21: error: 'struct meson_drm' has no member named 'afbcd'
     314 |                 priv->afbcd.ops->exit(priv);
         |                     ^~


vim +313 drivers/gpu/drm/meson/meson_drv.c

   168	
   169	static int meson_drv_bind_master(struct device *dev, bool has_components)
   170	{
   171		struct platform_device *pdev = to_platform_device(dev);
   172		struct meson_drm *priv;
   173		struct drm_device *drm;
   174		struct resource *res;
   175		void __iomem *regs;
   176		int ret;
   177	
   178		/* Checks if an output connector is available */
   179		if (!meson_vpu_has_available_connectors(dev)) {
   180			dev_err(dev, "No output connector available\n");
   181			return -ENODEV;
   182		}
   183	
   184		drm = drm_dev_alloc(&meson_driver, dev);
   185		if (IS_ERR(drm))
   186			return PTR_ERR(drm);
   187	
   188		priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
   189		if (!priv) {
   190			ret = -ENOMEM;
   191			goto free_drm;
   192		}
   193		drm->dev_private = priv;
   194		priv->drm = drm;
   195		priv->dev = dev;
   196	
   197		res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "vpu");
   198		regs = devm_ioremap_resource(dev, res);
   199		if (IS_ERR(regs)) {
   200			ret = PTR_ERR(regs);
   201			goto free_drm;
   202		}
   203	
   204		priv->io_base = regs;
   205	
   206		res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "hhi");
   207		if (!res) {
   208			ret = -EINVAL;
   209			goto free_drm;
   210		}
   211		/* Simply ioremap since it may be a shared register zone */
   212		regs = devm_ioremap(dev, res->start, resource_size(res));
   213		if (!regs) {
   214			ret = -EADDRNOTAVAIL;
   215			goto free_drm;
   216		}
   217	
   218		priv->hhi = devm_regmap_init_mmio(dev, regs,
   219						  &meson_regmap_config);
   220		if (IS_ERR(priv->hhi)) {
   221			dev_err(&pdev->dev, "Couldn't create the HHI regmap\n");
   222			ret = PTR_ERR(priv->hhi);
   223			goto free_drm;
   224		}
   225	
   226		res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "dmc");
   227		if (!res) {
   228			ret = -EINVAL;
   229			goto free_drm;
   230		}
   231		/* Simply ioremap since it may be a shared register zone */
   232		regs = devm_ioremap(dev, res->start, resource_size(res));
   233		if (!regs) {
   234			ret = -EADDRNOTAVAIL;
   235			goto free_drm;
   236		}
   237	
   238		priv->dmc = devm_regmap_init_mmio(dev, regs,
   239						  &meson_regmap_config);
   240		if (IS_ERR(priv->dmc)) {
   241			dev_err(&pdev->dev, "Couldn't create the DMC regmap\n");
   242			ret = PTR_ERR(priv->dmc);
   243			goto free_drm;
   244		}
   245	
   246		priv->vsync_irq = platform_get_irq(pdev, 0);
   247	
   248		ret = drm_vblank_init(drm, 1);
   249		if (ret)
   250			goto free_drm;
   251	
   252		drm_mode_config_init(drm);
   253		drm->mode_config.max_width = 3840;
   254		drm->mode_config.max_height = 2160;
   255		drm->mode_config.funcs = &meson_mode_config_funcs;
   256		drm->mode_config.helper_private	= &meson_mode_config_helpers;
   257	
   258		/* Hardware Initialization */
   259	
   260		meson_vpu_init(priv);
   261		meson_venc_init(priv);
   262		meson_vpp_init(priv);
   263		meson_viu_init(priv);
   264	
   265		/* Encoder Initialization */
   266	
   267		ret = meson_venc_cvbs_create(priv);
   268		if (ret)
   269			goto exit_afbcd;
   270	
   271		if (has_components) {
   272			ret = component_bind_all(drm->dev, drm);
   273			if (ret) {
   274				dev_err(drm->dev, "Couldn't bind all components\n");
   275				goto exit_afbcd;
   276			}
   277		}
   278	
   279		ret = meson_plane_create(priv);
   280		if (ret)
   281			goto exit_afbcd;
   282	
   283		ret = meson_crtc_create(priv);
   284		if (ret)
   285			goto exit_afbcd;
   286	
   287		ret = drm_irq_install(drm, priv->vsync_irq);
   288		if (ret)
   289			goto exit_afbcd;
   290	
   291		drm_mode_config_reset(drm);
   292	
   293		priv->fbdev = drm_fbdev_cma_init(drm, 32,
   294						 drm->mode_config.num_connector);
   295		if (IS_ERR(priv->fbdev)) {
   296			ret = PTR_ERR(priv->fbdev);
   297			goto free_drm;
   298		}
   299	
   300		drm_kms_helper_poll_init(drm);
   301	
   302		platform_set_drvdata(pdev, priv);
   303	
   304		ret = drm_dev_register(drm, 0);
   305		if (ret)
   306			goto uninstall_irq;
   307	
   308		return 0;
   309	
   310	uninstall_irq:
   311		drm_irq_uninstall(drm);
   312	exit_afbcd:
 > 313		if (priv->afbcd.ops)
   314			priv->afbcd.ops->exit(priv);
   315	free_drm:
   316		drm_dev_put(drm);
   317	
   318		return ret;
   319	}
   320	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
