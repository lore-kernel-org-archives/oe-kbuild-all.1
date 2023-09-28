Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A5E63C68B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Sep 2023 13:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695909152; x=1727445152;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OYloeEeO81SXQhy7G8+KRCwr/MYbrTRFepJKDkcJ3Ps=;
  b=JK72NZYnHEUU2IyMHaDb7f+xDZp6Zzj3J2cYj3imYk3iSiQDwBAufbE6
   lzLf7Mn74Z//oqcoMWqsYe2W0pcRVX7DwIjSbMjNQyYi3Hs7DT8FKgCD9
   9jUW9A0xB041Gubekv/+CLc+awNDV+6reXqn7J3UWaraNzDhUKoZoozgy
   zH1d2Rfcn8riNHxEUMOW/zdV+K+lfQcta7aXnUh5Hj620X35izeS6x4xl
   hMb54A8/R7fFFoR7dCQUDwEpcmK5PStZ4OTqm+0rpiHDIgVF9aE4A+tkl
   QfmH0nPFgrMYnBE2UM0kNOyiVE4v99zwQiwVFWZJjwGYVdesmrV8Rlsoo
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="468352281"
X-IronPort-AV: E=Sophos;i="6.03,184,1694761200"; 
   d="scan'208";a="468352281"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2023 06:52:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="815237219"
X-IronPort-AV: E=Sophos;i="6.03,184,1694761200"; 
   d="scan'208";a="815237219"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 28 Sep 2023 06:52:27 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qlrRJ-0001Vt-1C;
	Thu, 28 Sep 2023 13:52:25 +0000
Date: Thu, 28 Sep 2023 21:51:36 +0800
From: kernel test robot <lkp@intel.com>
To: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v8 2/5] media: platform: visconti: Add Toshiba Visconti
 Video Input Interface driver
Message-ID: <202309282119.VXILwBtX-lkp@intel.com>
References: <20230925232806.950683-3-yuji2.ishikawa@toshiba.co.jp>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230925232806.950683-3-yuji2.ishikawa@toshiba.co.jp>

Hi Yuji,

kernel test robot noticed the following build warnings:

[auto build test WARNING on media-tree/master]
[also build test WARNING on linus/master v6.6-rc3]
[cannot apply to next-20230928]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yuji-Ishikawa/dt-bindings-media-platform-visconti-Add-Toshiba-Visconti-Video-Input-Interface/20230926-073703
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20230925232806.950683-3-yuji2.ishikawa%40toshiba.co.jp
patch subject: [PATCH v8 2/5] media: platform: visconti: Add Toshiba Visconti Video Input Interface driver
config: arc-allmodconfig (https://download.01.org/0day-ci/archive/20230928/202309282119.VXILwBtX-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230928/202309282119.VXILwBtX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309282119.VXILwBtX-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/platform/toshiba/visconti/viif.c: In function 'visconti_viif_probe':
>> drivers/media/platform/toshiba/visconti/viif.c:498:32: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     498 |         viif_dev->tables_dma = (struct viif_table_area *)tables_dma;
         |                                ^
>> drivers/media/platform/toshiba/visconti/viif.c:574:21: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     574 |                     (dma_addr_t)viif_dev->tables_dma);
         |                     ^
   drivers/media/platform/toshiba/visconti/viif.c: In function 'visconti_viif_remove':
   drivers/media/platform/toshiba/visconti/viif.c:593:21: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     593 |                     (dma_addr_t)viif_dev->tables_dma);
         |                     ^


vim +498 drivers/media/platform/toshiba/visconti/viif.c

   443	
   444	static int visconti_viif_probe(struct platform_device *pdev)
   445	{
   446		struct device *dev = &pdev->dev;
   447		struct viif_device *viif_dev;
   448		dma_addr_t tables_dma;
   449		int ret, i;
   450	
   451		ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(36));
   452		if (ret)
   453			return ret;
   454	
   455		viif_dev = devm_kzalloc(dev, sizeof(*viif_dev), GFP_KERNEL);
   456		if (!viif_dev)
   457			return -ENOMEM;
   458	
   459		platform_set_drvdata(pdev, viif_dev);
   460		viif_dev->dev = dev;
   461	
   462		spin_lock_init(&viif_dev->regbuf_lock);
   463		mutex_init(&viif_dev->stream_lock);
   464	
   465		viif_dev->capture_reg = devm_platform_ioremap_resource(pdev, 0);
   466		if (IS_ERR(viif_dev->capture_reg))
   467			return PTR_ERR(viif_dev->capture_reg);
   468	
   469		viif_dev->csi2host_reg = devm_platform_ioremap_resource(pdev, 1);
   470		if (IS_ERR(viif_dev->csi2host_reg))
   471			return PTR_ERR(viif_dev->csi2host_reg);
   472	
   473		viif_dev->hwaif_reg = devm_platform_ioremap_resource(pdev, 2);
   474		if (IS_ERR(viif_dev->hwaif_reg))
   475			return PTR_ERR(viif_dev->hwaif_reg);
   476	
   477		viif_dev->mpu_reg = devm_platform_ioremap_resource(pdev, 3);
   478		if (IS_ERR(viif_dev->mpu_reg))
   479			return PTR_ERR(viif_dev->mpu_reg);
   480	
   481		viif_dev->run_flag_main = false;
   482	
   483		for (i = 0; i < NUM_IRQS; i++) {
   484			ret = platform_get_irq(pdev, i);
   485			if (ret < 0)
   486				return dev_err_probe(dev, ret, "failed to acquire irq resource\n");
   487			viif_dev->irq[i] = ret;
   488			ret = devm_request_irq(dev, viif_dev->irq[i], visconti_viif_irq, 0, IRQ_ID_STR,
   489					       viif_dev);
   490			if (ret)
   491				return dev_err_probe(dev, ret, "irq request failed\n");
   492		}
   493	
   494		viif_dev->tables =
   495			dma_alloc_wc(dev, sizeof(struct viif_table_area), &tables_dma, GFP_KERNEL);
   496		if (!viif_dev->tables)
   497			return -ENOMEM;
 > 498		viif_dev->tables_dma = (struct viif_table_area *)tables_dma;
   499	
   500		pm_runtime_enable(dev);
   501	
   502		/* build media_dev */
   503		viif_dev->media_dev.hw_revision = 0;
   504		strscpy(viif_dev->media_dev.model, VIIF_DRIVER_NAME, sizeof(viif_dev->media_dev.model));
   505		viif_dev->media_dev.dev = dev;
   506		/* TODO: platform:visconti-viif-0,1,2,3 for each VIIF driver instance */
   507		snprintf(viif_dev->media_dev.bus_info, sizeof(viif_dev->media_dev.bus_info), "%s-0",
   508			 VIIF_BUS_INFO_BASE);
   509		media_device_init(&viif_dev->media_dev);
   510	
   511		/* build v4l2_dev */
   512		viif_dev->v4l2_dev.mdev = &viif_dev->media_dev;
   513		ret = v4l2_device_register(dev, &viif_dev->v4l2_dev);
   514		if (ret)
   515			goto error_dma_free;
   516	
   517		ret = media_device_register(&viif_dev->media_dev);
   518		if (ret) {
   519			dev_err_probe(dev, ret, "Failed to register media device\n");
   520			goto error_v4l2_unregister;
   521		}
   522	
   523		ret = visconti_viif_csi2rx_register(viif_dev);
   524		if (ret) {
   525			dev_err_probe(dev, ret, "failed to register csi2rx sub node\n");
   526			goto error_media_unregister;
   527		}
   528	
   529		ret = visconti_viif_isp_register(viif_dev);
   530		if (ret) {
   531			dev_err_probe(dev, ret, "failed to register isp sub node\n");
   532			goto error_csi2rx_unregister;
   533		}
   534	
   535		ret = visconti_viif_capture_register(viif_dev);
   536		if (ret) {
   537			dev_err_probe(dev, ret, "failed to register capture node\n");
   538			goto error_isp_unregister;
   539		}
   540	
   541		ret = visconti_viif_create_links(viif_dev);
   542		if (ret)
   543			goto error_capture_unregister;
   544	
   545		visconti_viif_subdev_notifier_register(viif_dev);
   546		if (ret)
   547			goto error_capture_unregister;
   548	
   549		viif_dev->wq = create_workqueue("visconti-viif");
   550		if (!viif_dev->wq) {
   551			ret = dev_err_probe(dev, -ENOMEM, "failed to create workqueue\n");
   552			goto error_notifier_unregister;
   553		}
   554		INIT_WORK(&viif_dev->work, visconti_viif_wthread_l1info);
   555	
   556		return 0;
   557	
   558	error_notifier_unregister:
   559		v4l2_async_nf_unregister(&viif_dev->notifier);
   560		v4l2_async_nf_cleanup(&viif_dev->notifier);
   561	error_capture_unregister:
   562		visconti_viif_capture_unregister(viif_dev);
   563	error_isp_unregister:
   564		visconti_viif_isp_unregister(viif_dev);
   565	error_csi2rx_unregister:
   566		visconti_viif_csi2rx_unregister(viif_dev);
   567	error_media_unregister:
   568		media_device_unregister(&viif_dev->media_dev);
   569	error_v4l2_unregister:
   570		v4l2_device_unregister(&viif_dev->v4l2_dev);
   571	error_dma_free:
   572		pm_runtime_disable(dev);
   573		dma_free_wc(&pdev->dev, sizeof(struct viif_table_area), viif_dev->tables,
 > 574			    (dma_addr_t)viif_dev->tables_dma);
   575		return ret;
   576	}
   577	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
