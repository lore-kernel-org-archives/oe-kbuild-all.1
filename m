Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13E3FD2EE
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Aug 2023 10:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692180670; x=1723716670;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HBFGp3AJzTgd4yZbPOobIdUikY5EohDsS/jhOCJX87Q=;
  b=CKV4PHXSWiRN69OrF8oXZFB39qYNvUnrt+QgT29fNYIXrK3x99ARBOe7
   yAtJlgFJfh69LuCWYsJLs6yIqdfkcgEuubCrUPgN6w58uwXuuJL4cZCKj
   doW+u2wn0JfXhQRdpcoEJOKfnxR7OxhMhyXwqw+HB+fkjFVESbXHVctch
   oaeSvlafAmD6g+38Wukfzozx/o41JpiZWnsWnEZLUZxcDbUvKnaGfLiV9
   iR5eNfAf2WcNg8xApm82FGGp2hSfnZucpV2MjQSaOM4zsbMWZ7YbX4lwi
   LnXRYzBVB8dCdmnlbnCoihF33+OQPwvMgvXqC/JgYBhBwMkpGRr7GYKa6
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="375263468"
X-IronPort-AV: E=Sophos;i="6.01,176,1684825200"; 
   d="scan'208";a="375263468"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2023 03:11:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="737244969"
X-IronPort-AV: E=Sophos;i="6.01,176,1684825200"; 
   d="scan'208";a="737244969"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 16 Aug 2023 03:11:08 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWDUZ-0000Dh-1C;
	Wed, 16 Aug 2023 10:11:07 +0000
Date: Wed, 16 Aug 2023 18:10:46 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-5.10 115/141]
 drivers/gpu/drm/msm/msm_drv.c:442:17: error: label 'err_put_dev' used but
 not defined
Message-ID: <202308161817.Gi4FXOR5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-5.10
head:   82320ddb4a62efc1d70c8839bddb59ef879e4fb1
commit: 7b131174452366a1ac873024eb84152cacc8a5e1 [115/141] drm/msm: fix missing wq allocation error handling
config: arm-randconfig-r046-20230816 (https://download.01.org/0day-ci/archive/20230816/202308161817.Gi4FXOR5-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230816/202308161817.Gi4FXOR5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308161817.Gi4FXOR5-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/msm/msm_drv.c:124:15: warning: no previous prototype for '_msm_ioremap' [-Wmissing-prototypes]
     124 | void __iomem *_msm_ioremap(struct platform_device *pdev, const char *name,
         |               ^~~~~~~~~~~~
   drivers/gpu/drm/msm/msm_drv.c: In function 'msm_drm_init':
>> drivers/gpu/drm/msm/msm_drv.c:442:17: error: label 'err_put_dev' used but not defined
     442 |                 goto err_put_dev;
         |                 ^~~~


vim +/err_put_dev +442 drivers/gpu/drm/msm/msm_drv.c

   396	
   397	static int msm_drm_init(struct device *dev, struct drm_driver *drv)
   398	{
   399		struct platform_device *pdev = to_platform_device(dev);
   400		struct drm_device *ddev;
   401		struct msm_drm_private *priv;
   402		struct msm_kms *kms;
   403		struct msm_mdss *mdss;
   404		int ret, i;
   405	
   406		ddev = drm_dev_alloc(drv, dev);
   407		if (IS_ERR(ddev)) {
   408			DRM_DEV_ERROR(dev, "failed to allocate drm_device\n");
   409			return PTR_ERR(ddev);
   410		}
   411	
   412		platform_set_drvdata(pdev, ddev);
   413	
   414		priv = kzalloc(sizeof(*priv), GFP_KERNEL);
   415		if (!priv) {
   416			ret = -ENOMEM;
   417			goto err_put_drm_dev;
   418		}
   419	
   420		ddev->dev_private = priv;
   421		priv->dev = ddev;
   422	
   423		switch (get_mdp_ver(pdev)) {
   424		case KMS_MDP5:
   425			ret = mdp5_mdss_init(ddev);
   426			break;
   427		case KMS_DPU:
   428			ret = dpu_mdss_init(ddev);
   429			break;
   430		default:
   431			ret = 0;
   432			break;
   433		}
   434		if (ret)
   435			goto err_free_priv;
   436	
   437		mdss = priv->mdss;
   438	
   439		priv->wq = alloc_ordered_workqueue("msm", 0);
   440		if (!priv->wq) {
   441			ret = -ENOMEM;
 > 442			goto err_put_dev;
   443		}
   444	
   445		INIT_WORK(&priv->free_work, msm_gem_free_work);
   446		init_llist_head(&priv->free_list);
   447	
   448		INIT_LIST_HEAD(&priv->inactive_list);
   449	
   450		drm_mode_config_init(ddev);
   451	
   452		ret = msm_init_vram(ddev);
   453		if (ret)
   454			goto err_destroy_mdss;
   455	
   456		/* Bind all our sub-components: */
   457		ret = component_bind_all(dev, ddev);
   458		if (ret)
   459			goto err_destroy_mdss;
   460	
   461		dma_set_max_seg_size(dev, UINT_MAX);
   462	
   463		msm_gem_shrinker_init(ddev);
   464	
   465		switch (get_mdp_ver(pdev)) {
   466		case KMS_MDP4:
   467			kms = mdp4_kms_init(ddev);
   468			priv->kms = kms;
   469			break;
   470		case KMS_MDP5:
   471			kms = mdp5_kms_init(ddev);
   472			break;
   473		case KMS_DPU:
   474			kms = dpu_kms_init(ddev);
   475			priv->kms = kms;
   476			break;
   477		default:
   478			/* valid only for the dummy headless case, where of_node=NULL */
   479			WARN_ON(dev->of_node);
   480			kms = NULL;
   481			break;
   482		}
   483	
   484		if (IS_ERR(kms)) {
   485			DRM_DEV_ERROR(dev, "failed to load kms\n");
   486			ret = PTR_ERR(kms);
   487			priv->kms = NULL;
   488			goto err_msm_uninit;
   489		}
   490	
   491		/* Enable normalization of plane zpos */
   492		ddev->mode_config.normalize_zpos = true;
   493	
   494		if (kms) {
   495			kms->dev = ddev;
   496			ret = kms->funcs->hw_init(kms);
   497			if (ret) {
   498				DRM_DEV_ERROR(dev, "kms hw init failed: %d\n", ret);
   499				goto err_msm_uninit;
   500			}
   501		}
   502	
   503		ddev->mode_config.funcs = &mode_config_funcs;
   504		ddev->mode_config.helper_private = &mode_config_helper_funcs;
   505	
   506		for (i = 0; i < priv->num_crtcs; i++) {
   507			/* initialize event thread */
   508			priv->event_thread[i].crtc_id = priv->crtcs[i]->base.id;
   509			priv->event_thread[i].dev = ddev;
   510			priv->event_thread[i].worker = kthread_create_worker(0,
   511				"crtc_event:%d", priv->event_thread[i].crtc_id);
   512			if (IS_ERR(priv->event_thread[i].worker)) {
   513				ret = PTR_ERR(priv->event_thread[i].worker);
   514				DRM_DEV_ERROR(dev, "failed to create crtc_event kthread\n");
   515				goto err_msm_uninit;
   516			}
   517	
   518			sched_set_fifo(priv->event_thread[i].worker->task);
   519		}
   520	
   521		ret = drm_vblank_init(ddev, priv->num_crtcs);
   522		if (ret < 0) {
   523			DRM_DEV_ERROR(dev, "failed to initialize vblank\n");
   524			goto err_msm_uninit;
   525		}
   526	
   527		if (kms) {
   528			pm_runtime_get_sync(dev);
   529			ret = drm_irq_install(ddev, kms->irq);
   530			pm_runtime_put_sync(dev);
   531			if (ret < 0) {
   532				DRM_DEV_ERROR(dev, "failed to install IRQ handler\n");
   533				goto err_msm_uninit;
   534			}
   535		}
   536	
   537		ret = drm_dev_register(ddev, 0);
   538		if (ret)
   539			goto err_msm_uninit;
   540	
   541		drm_mode_config_reset(ddev);
   542	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
