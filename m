Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6270E8835
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Mar 2023 16:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680193083; x=1711729083;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WnLD2hbD2qPzRQtas7r82x1N3J/779WO8aRVpk4w3lI=;
  b=YjdV+ItgHPAL8sr4QqvlxNhIZlOXHGppbMR2kew0HZib0kD+SGBsh0XU
   ytt/aX1YCF31DplxwAT2Ld1rbbELPSEK47kS46WVev8eypOd8SEtoiMf0
   CTDNWPvRioudVFKOxA/+cIHx2b/xPoB3ngBYCfgBRiGTNgco3JBxJMiXh
   xLM5ljQjPobsgeJmCVns6MxhOfUnzAbRXzn9alwEpiaE1/Vnrr97OU7hj
   112NYOTZ6crSOVH3BCYasnElfLgAEtrqZM0rL9JcIAKOiG7VdCFMk5pL8
   /fSusLZHuMMcc+n61p2RWzrReJf/Ip5ngRnzj0UMYmtM4MVnmi8BnKr5l
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="341230260"
X-IronPort-AV: E=Sophos;i="5.98,305,1673942400"; 
   d="scan'208";a="341230260"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2023 09:18:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="808718917"
X-IronPort-AV: E=Sophos;i="5.98,305,1673942400"; 
   d="scan'208";a="808718917"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 30 Mar 2023 09:18:01 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phuyO-000Kzp-24;
	Thu, 30 Mar 2023 16:18:00 +0000
Date: Fri, 31 Mar 2023 00:17:25 +0800
From: kernel test robot <lkp@intel.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: oe-kbuild-all@lists.linux.dev, Sasha Levin <sashal@kernel.org>,
	Neil Armstrong <narmstrong@baylibre.com>
Subject: [linux-stable-rc:queue/5.4 62/72]
 drivers/gpu/drm/meson/meson_drv.c:343:17: error: 'struct meson_drm' has no
 member named 'afbcd'
Message-ID: <202303310016.tc4BlcbT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git queue/5.4
head:   adbd85cd59484b90ddc1ac24815f31321af5c9b4
commit: f9114e25f5276ee51bbd8a8f1b949ba896db051d [62/72] drm/meson: Fix error handling when afbcd.ops->init fails
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20230331/202303310016.tc4BlcbT-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?id=f9114e25f5276ee51bbd8a8f1b949ba896db051d
        git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
        git fetch --no-tags linux-stable-rc queue/5.4
        git checkout f9114e25f5276ee51bbd8a8f1b949ba896db051d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/gpu/drm/meson/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303310016.tc4BlcbT-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/meson/meson_drv.c: In function 'meson_drv_bind_master':
>> drivers/gpu/drm/meson/meson_drv.c:343:17: error: 'struct meson_drm' has no member named 'afbcd'
     343 |         if (priv->afbcd.ops)
         |                 ^~
   drivers/gpu/drm/meson/meson_drv.c:344:21: error: 'struct meson_drm' has no member named 'afbcd'
     344 |                 priv->afbcd.ops->exit(priv);
         |                     ^~


vim +343 drivers/gpu/drm/meson/meson_drv.c

   186	
   187	static int meson_drv_bind_master(struct device *dev, bool has_components)
   188	{
   189		struct platform_device *pdev = to_platform_device(dev);
   190		struct meson_drm *priv;
   191		struct drm_device *drm;
   192		struct resource *res;
   193		void __iomem *regs;
   194		int ret;
   195	
   196		/* Checks if an output connector is available */
   197		if (!meson_vpu_has_available_connectors(dev)) {
   198			dev_err(dev, "No output connector available\n");
   199			return -ENODEV;
   200		}
   201	
   202		drm = drm_dev_alloc(&meson_driver, dev);
   203		if (IS_ERR(drm))
   204			return PTR_ERR(drm);
   205	
   206		priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
   207		if (!priv) {
   208			ret = -ENOMEM;
   209			goto free_drm;
   210		}
   211		drm->dev_private = priv;
   212		priv->drm = drm;
   213		priv->dev = dev;
   214	
   215		priv->compat = (enum vpu_compatible)of_device_get_match_data(priv->dev);
   216	
   217		res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "vpu");
   218		regs = devm_ioremap_resource(dev, res);
   219		if (IS_ERR(regs)) {
   220			ret = PTR_ERR(regs);
   221			goto free_drm;
   222		}
   223	
   224		priv->io_base = regs;
   225	
   226		res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "hhi");
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
   238		priv->hhi = devm_regmap_init_mmio(dev, regs,
   239						  &meson_regmap_config);
   240		if (IS_ERR(priv->hhi)) {
   241			dev_err(&pdev->dev, "Couldn't create the HHI regmap\n");
   242			ret = PTR_ERR(priv->hhi);
   243			goto free_drm;
   244		}
   245	
   246		priv->canvas = meson_canvas_get(dev);
   247		if (IS_ERR(priv->canvas)) {
   248			ret = PTR_ERR(priv->canvas);
   249			goto free_drm;
   250		}
   251	
   252		ret = meson_canvas_alloc(priv->canvas, &priv->canvas_id_osd1);
   253		if (ret)
   254			goto free_drm;
   255		ret = meson_canvas_alloc(priv->canvas, &priv->canvas_id_vd1_0);
   256		if (ret) {
   257			meson_canvas_free(priv->canvas, priv->canvas_id_osd1);
   258			goto free_drm;
   259		}
   260		ret = meson_canvas_alloc(priv->canvas, &priv->canvas_id_vd1_1);
   261		if (ret) {
   262			meson_canvas_free(priv->canvas, priv->canvas_id_osd1);
   263			meson_canvas_free(priv->canvas, priv->canvas_id_vd1_0);
   264			goto free_drm;
   265		}
   266		ret = meson_canvas_alloc(priv->canvas, &priv->canvas_id_vd1_2);
   267		if (ret) {
   268			meson_canvas_free(priv->canvas, priv->canvas_id_osd1);
   269			meson_canvas_free(priv->canvas, priv->canvas_id_vd1_0);
   270			meson_canvas_free(priv->canvas, priv->canvas_id_vd1_1);
   271			goto free_drm;
   272		}
   273	
   274		priv->vsync_irq = platform_get_irq(pdev, 0);
   275	
   276		ret = drm_vblank_init(drm, 1);
   277		if (ret)
   278			goto free_drm;
   279	
   280		/* Remove early framebuffers (ie. simplefb) */
   281		meson_remove_framebuffers();
   282	
   283		drm_mode_config_init(drm);
   284		drm->mode_config.max_width = 3840;
   285		drm->mode_config.max_height = 2160;
   286		drm->mode_config.funcs = &meson_mode_config_funcs;
   287		drm->mode_config.helper_private	= &meson_mode_config_helpers;
   288	
   289		/* Hardware Initialization */
   290	
   291		meson_vpu_init(priv);
   292		meson_venc_init(priv);
   293		meson_vpp_init(priv);
   294		meson_viu_init(priv);
   295	
   296		/* Encoder Initialization */
   297	
   298		ret = meson_venc_cvbs_create(priv);
   299		if (ret)
   300			goto exit_afbcd;
   301	
   302		if (has_components) {
   303			ret = component_bind_all(drm->dev, drm);
   304			if (ret) {
   305				dev_err(drm->dev, "Couldn't bind all components\n");
   306				goto exit_afbcd;
   307			}
   308		}
   309	
   310		ret = meson_plane_create(priv);
   311		if (ret)
   312			goto exit_afbcd;
   313	
   314		ret = meson_overlay_create(priv);
   315		if (ret)
   316			goto exit_afbcd;
   317	
   318		ret = meson_crtc_create(priv);
   319		if (ret)
   320			goto exit_afbcd;
   321	
   322		ret = drm_irq_install(drm, priv->vsync_irq);
   323		if (ret)
   324			goto exit_afbcd;
   325	
   326		drm_mode_config_reset(drm);
   327	
   328		drm_kms_helper_poll_init(drm);
   329	
   330		platform_set_drvdata(pdev, priv);
   331	
   332		ret = drm_dev_register(drm, 0);
   333		if (ret)
   334			goto uninstall_irq;
   335	
   336		drm_fbdev_generic_setup(drm, 32);
   337	
   338		return 0;
   339	
   340	uninstall_irq:
   341		drm_irq_uninstall(drm);
   342	exit_afbcd:
 > 343		if (priv->afbcd.ops)
   344			priv->afbcd.ops->exit(priv);
   345	free_drm:
   346		drm_dev_put(drm);
   347	
   348		return ret;
   349	}
   350	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
