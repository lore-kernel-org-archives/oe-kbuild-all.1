Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BB9F17F7
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Aug 2023 07:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692171750; x=1723707750;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZKR9IdpXaIlPQ3j/VN1Z9bqLAD48fsodFR9yGyU39rs=;
  b=MHfHAsdssx0hiSp8ysz2UGYsXQ48mct1JFO41GHEKTQOsPtVicN/LaSL
   eVE9j80ZeLsSl9iXVgibikU49iScmitzs2ZIBSAXEICulknwjKwvNRjmo
   68rm7aQ7Uqg/nHLQDavbG13gsah8k2fln7OhVMxIpGZpfISK9j8hHeR7z
   Ty2cGkSvmcBgO9yr3KoIHz31sHfsKD8cqh0fhB8OfzDpiIvc1Vg/u7ftn
   hBbC1WjeIqT2iiYwXueByYvkdFlvVNuRR2SYohP34z93MMMWZ4SGX4L9n
   0OaCH3wo25z25gJjUdS8UwWQPTP2rbYhDIZT1SolnT5Ypz6ztVpVlp2y5
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="436368955"
X-IronPort-AV: E=Sophos;i="6.01,176,1684825200"; 
   d="scan'208";a="436368955"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2023 00:42:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="734106288"
X-IronPort-AV: E=Sophos;i="6.01,176,1684825200"; 
   d="scan'208";a="734106288"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 16 Aug 2023 00:42:24 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWBAd-00006c-2C;
	Wed, 16 Aug 2023 07:42:23 +0000
Date: Wed, 16 Aug 2023 15:41:39 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-4.19 49/86]
 drivers/gpu/drm/msm/msm_drv.c:480:17: error: label 'err_put_dev' used but
 not defined
Message-ID: <202308161510.sZfICcIV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-4.19
head:   3c9b1cd23f26ebece806d92b8b99b79ed108cbc1
commit: 4d0e15427c26f8cf935cd0369ad3066ef8d6889e [49/86] drm/msm: fix missing wq allocation error handling
config: arm-randconfig-r025-20230816 (https://download.01.org/0day-ci/archive/20230816/202308161510.sZfICcIV-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230816/202308161510.sZfICcIV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308161510.sZfICcIV-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/msm/msm_drv.c: In function 'msm_drm_init':
>> drivers/gpu/drm/msm/msm_drv.c:480:17: error: label 'err_put_dev' used but not defined
     480 |                 goto err_put_dev;
         |                 ^~~~


vim +/err_put_dev +480 drivers/gpu/drm/msm/msm_drv.c

   433	
   434	static int msm_drm_init(struct device *dev, struct drm_driver *drv)
   435	{
   436		struct platform_device *pdev = to_platform_device(dev);
   437		struct drm_device *ddev;
   438		struct msm_drm_private *priv;
   439		struct msm_kms *kms;
   440		struct msm_mdss *mdss;
   441		int ret, i;
   442		struct sched_param param;
   443	
   444		ddev = drm_dev_alloc(drv, dev);
   445		if (IS_ERR(ddev)) {
   446			dev_err(dev, "failed to allocate drm_device\n");
   447			return PTR_ERR(ddev);
   448		}
   449	
   450		platform_set_drvdata(pdev, ddev);
   451	
   452		priv = kzalloc(sizeof(*priv), GFP_KERNEL);
   453		if (!priv) {
   454			ret = -ENOMEM;
   455			goto err_unref_drm_dev;
   456		}
   457	
   458		ddev->dev_private = priv;
   459		priv->dev = ddev;
   460	
   461		switch (get_mdp_ver(pdev)) {
   462		case KMS_MDP5:
   463			ret = mdp5_mdss_init(ddev);
   464			break;
   465		case KMS_DPU:
   466			ret = dpu_mdss_init(ddev);
   467			break;
   468		default:
   469			ret = 0;
   470			break;
   471		}
   472		if (ret)
   473			goto err_free_priv;
   474	
   475		mdss = priv->mdss;
   476	
   477		priv->wq = alloc_ordered_workqueue("msm", 0);
   478		if (!priv->wq) {
   479			ret = -ENOMEM;
 > 480			goto err_put_dev;
   481		}
   482	
   483		INIT_LIST_HEAD(&priv->inactive_list);
   484		INIT_LIST_HEAD(&priv->vblank_ctrl.event_list);
   485		kthread_init_work(&priv->vblank_ctrl.work, vblank_ctrl_worker);
   486		spin_lock_init(&priv->vblank_ctrl.lock);
   487	
   488		drm_mode_config_init(ddev);
   489	
   490		ret = msm_init_vram(ddev);
   491		if (ret)
   492			goto err_destroy_mdss;
   493	
   494		/* Bind all our sub-components: */
   495		ret = component_bind_all(dev, ddev);
   496		if (ret)
   497			goto err_destroy_mdss;
   498	
   499		if (!dev->dma_parms) {
   500			dev->dma_parms = devm_kzalloc(dev, sizeof(*dev->dma_parms),
   501						      GFP_KERNEL);
   502			if (!dev->dma_parms) {
   503				ret = -ENOMEM;
   504				goto err_msm_uninit;
   505			}
   506		}
   507		dma_set_max_seg_size(dev, DMA_BIT_MASK(32));
   508	
   509		msm_gem_shrinker_init(ddev);
   510	
   511		switch (get_mdp_ver(pdev)) {
   512		case KMS_MDP4:
   513			kms = mdp4_kms_init(ddev);
   514			priv->kms = kms;
   515			break;
   516		case KMS_MDP5:
   517			kms = mdp5_kms_init(ddev);
   518			break;
   519		case KMS_DPU:
   520			kms = dpu_kms_init(ddev);
   521			priv->kms = kms;
   522			break;
   523		default:
   524			kms = ERR_PTR(-ENODEV);
   525			break;
   526		}
   527	
   528		if (IS_ERR(kms)) {
   529			/*
   530			 * NOTE: once we have GPU support, having no kms should not
   531			 * be considered fatal.. ideally we would still support gpu
   532			 * and (for example) use dmabuf/prime to share buffers with
   533			 * imx drm driver on iMX5
   534			 */
   535			dev_err(dev, "failed to load kms\n");
   536			ret = PTR_ERR(kms);
   537			goto err_msm_uninit;
   538		}
   539	
   540		/* Enable normalization of plane zpos */
   541		ddev->mode_config.normalize_zpos = true;
   542	
   543		if (kms) {
   544			ret = kms->funcs->hw_init(kms);
   545			if (ret) {
   546				dev_err(dev, "kms hw init failed: %d\n", ret);
   547				goto err_msm_uninit;
   548			}
   549		}
   550	
   551		ddev->mode_config.funcs = &mode_config_funcs;
   552		ddev->mode_config.helper_private = &mode_config_helper_funcs;
   553	
   554		/**
   555		 * this priority was found during empiric testing to have appropriate
   556		 * realtime scheduling to process display updates and interact with
   557		 * other real time and normal priority task
   558		 */
   559		param.sched_priority = 16;
   560		for (i = 0; i < priv->num_crtcs; i++) {
   561	
   562			/* initialize display thread */
   563			priv->disp_thread[i].crtc_id = priv->crtcs[i]->base.id;
   564			kthread_init_worker(&priv->disp_thread[i].worker);
   565			priv->disp_thread[i].dev = ddev;
   566			priv->disp_thread[i].thread =
   567				kthread_run(kthread_worker_fn,
   568					&priv->disp_thread[i].worker,
   569					"crtc_commit:%d", priv->disp_thread[i].crtc_id);
   570			ret = sched_setscheduler(priv->disp_thread[i].thread,
   571								SCHED_FIFO, &param);
   572			if (ret)
   573				pr_warn("display thread priority update failed: %d\n",
   574										ret);
   575	
   576			if (IS_ERR(priv->disp_thread[i].thread)) {
   577				dev_err(dev, "failed to create crtc_commit kthread\n");
   578				priv->disp_thread[i].thread = NULL;
   579			}
   580	
   581			/* initialize event thread */
   582			priv->event_thread[i].crtc_id = priv->crtcs[i]->base.id;
   583			kthread_init_worker(&priv->event_thread[i].worker);
   584			priv->event_thread[i].dev = ddev;
   585			priv->event_thread[i].thread =
   586				kthread_run(kthread_worker_fn,
   587					&priv->event_thread[i].worker,
   588					"crtc_event:%d", priv->event_thread[i].crtc_id);
   589			/**
   590			 * event thread should also run at same priority as disp_thread
   591			 * because it is handling frame_done events. A lower priority
   592			 * event thread and higher priority disp_thread can causes
   593			 * frame_pending counters beyond 2. This can lead to commit
   594			 * failure at crtc commit level.
   595			 */
   596			ret = sched_setscheduler(priv->event_thread[i].thread,
   597								SCHED_FIFO, &param);
   598			if (ret)
   599				pr_warn("display event thread priority update failed: %d\n",
   600										ret);
   601	
   602			if (IS_ERR(priv->event_thread[i].thread)) {
   603				dev_err(dev, "failed to create crtc_event kthread\n");
   604				priv->event_thread[i].thread = NULL;
   605			}
   606	
   607			if ((!priv->disp_thread[i].thread) ||
   608					!priv->event_thread[i].thread) {
   609				/* clean up previously created threads if any */
   610				for ( ; i >= 0; i--) {
   611					if (priv->disp_thread[i].thread) {
   612						kthread_stop(
   613							priv->disp_thread[i].thread);
   614						priv->disp_thread[i].thread = NULL;
   615					}
   616	
   617					if (priv->event_thread[i].thread) {
   618						kthread_stop(
   619							priv->event_thread[i].thread);
   620						priv->event_thread[i].thread = NULL;
   621					}
   622				}
   623				goto err_msm_uninit;
   624			}
   625		}
   626	
   627		ret = drm_vblank_init(ddev, priv->num_crtcs);
   628		if (ret < 0) {
   629			dev_err(dev, "failed to initialize vblank\n");
   630			goto err_msm_uninit;
   631		}
   632	
   633		if (kms) {
   634			pm_runtime_get_sync(dev);
   635			ret = drm_irq_install(ddev, kms->irq);
   636			pm_runtime_put_sync(dev);
   637			if (ret < 0) {
   638				dev_err(dev, "failed to install IRQ handler\n");
   639				goto err_msm_uninit;
   640			}
   641		}
   642	
   643		ret = drm_dev_register(ddev, 0);
   644		if (ret)
   645			goto err_msm_uninit;
   646	
   647		drm_mode_config_reset(ddev);
   648	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
