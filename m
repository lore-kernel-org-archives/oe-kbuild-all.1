Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0BB1854
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Jan 2025 00:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736555478; cv=none; b=TNjlQRFcXQPYdh1I9RXdLfsAuhwzrx/3nVdTqLK2HgjBhjvWGXjniWW3vGSJ4D43TUtIABFiAMc411DFAS3O3IVEr+a9085tneIwIDOB47umRchwXaqYWA+8dRWXqob4ajJlm2V9tZ23V6H4k8lVMeb3ybvy/w5rhQ6ZhBPYilo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736555478; c=relaxed/simple;
	bh=nWWy5LkvBAlBNeQ4oVZgtlULV+ngO3ONTfOtxztxDqk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kjrGWHV8eI5DrN0SW9Tvizv+HD3XEQdfcG0Uo2NzFcBScftzZSErD5Jx1BFPyVWig6+32zcCLRwgvA9D35ts7QavVJKZzDZnZ6tlwtIVKTw6wuluDgTYvnaP9Qrl/gOURi9jVXtE3D/vo7fRFWA+K9I/nsShgPSN5DdvUHMFC4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l3wawk6i; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l3wawk6i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736555476; x=1768091476;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nWWy5LkvBAlBNeQ4oVZgtlULV+ngO3ONTfOtxztxDqk=;
  b=l3wawk6iYu+sNZofDCtUbZBomTn5EJwG2HQvRquwMJyNEVM4gWwpZCWm
   EWTuISRYFofb1DEu4JucD12kzdTpebqgVO+KO9gloGmuDDR5wRMjmYlxY
   UbLvKr04zJNwThMMr6K/IEk/r0GQXgvLu8pANxwR3fAURbeYqN9/xpVEZ
   oUTdSbGBj7rbd4xdsvFZr1J1J9xFkS4agOUqmUAdTkldjdp3nC2KDGjWd
   /jGxu98xBP7j8+H2bcxxK+grhmYhrvdpEdfXoh5/apqPfveqT74Lxlpo2
   Lzjml9HsuZv5u3NJ0aAlGlfT4fGMUpIYz4G7AQSnEPeaJdSOiCtCBjpby
   w==;
X-CSE-ConnectionGUID: wvkQkcAlQnegaKCG5DSMWw==
X-CSE-MsgGUID: xKo3BvBGRxG+iMfY9HBFXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="37024440"
X-IronPort-AV: E=Sophos;i="6.12,305,1728975600"; 
   d="scan'208";a="37024440"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2025 16:31:02 -0800
X-CSE-ConnectionGUID: 7ckCV2dsSV+EcYEbWUPP/Q==
X-CSE-MsgGUID: LaSbEwtLQjKUdiik02kwYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="108985678"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 10 Jan 2025 16:31:00 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWPP0-000JxZ-1h;
	Sat, 11 Jan 2025 00:30:58 +0000
Date: Sat, 11 Jan 2025 08:29:57 +0800
From: kernel test robot <lkp@intel.com>
To: Rajesh Gugulothu <gugulothu.rajesh@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>, Hyun Kwon <hyun.kwon@xilinx.com>,
	Vishal Sagar <vishal.sagar@xilinx.com>
Subject: [xilinx-xlnx:lkp_test 258/504]
 drivers/media/platform/xilinx/xilinx-dprxss.c:2603:71: warning: 'snprintf'
 output may be truncated before the last format character
Message-ID: <202501110815.m7vkG8Mu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx lkp_test
head:   9ac6b4acf9144465ac1408d4d799635dec0223a0
commit: a76e9bb15d68490da1eed3472ee1f554447a4a00 [258/504] v4l: xilinx: Driver support for Xilinx DP Rx subsystem
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20250111/202501110815.m7vkG8Mu-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250111/202501110815.m7vkG8Mu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501110815.m7vkG8Mu-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/platform/xilinx/xilinx-dprxss.c: In function 'xdprxss_probe':
>> drivers/media/platform/xilinx/xilinx-dprxss.c:2603:71: warning: 'snprintf' output may be truncated before the last format character [-Wformat-truncation=]
    2603 |                         snprintf(phy_name, sizeof(phy_name), "dp-phy%u", i);
         |                                                                       ^
   drivers/media/platform/xilinx/xilinx-dprxss.c:2603:25: note: 'snprintf' output between 8 and 17 bytes into a destination of size 16
    2603 |                         snprintf(phy_name, sizeof(phy_name), "dp-phy%u", i);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
>> drivers/media/platform/xilinx/xilinx-dprxss.c:520: warning: Excess struct member 'rx_dec_clk' description in 'xdprxss_state'


vim +/snprintf +2603 drivers/media/platform/xilinx/xilinx-dprxss.c

  2522	
  2523	static int xdprxss_probe(struct platform_device *pdev)
  2524	{
  2525		struct v4l2_subdev *subdev;
  2526		struct xdprxss_state *xdprxss;
  2527		struct device_node *node;
  2528		struct device *dev = &pdev->dev;
  2529		struct resource *res;
  2530		int ret, irq;
  2531		unsigned int i = 0, j;
  2532		struct xlnx_dprx_audio_data *adata;
  2533	
  2534		xdprxss = devm_kzalloc(dev, sizeof(*xdprxss), GFP_KERNEL);
  2535		if (!xdprxss)
  2536			return -ENOMEM;
  2537	
  2538		xdprxss->dev = &pdev->dev;
  2539		node = xdprxss->dev->of_node;
  2540	
  2541		ret = xlnx_find_device(pdev, xdprxss, "xlnx,dp-retimer");
  2542		if (ret)
  2543			return ret;
  2544		xdprxss->retimer_prvdata = xdprxss->prvdata;
  2545	
  2546		ret = xlnx_find_device(pdev, xdprxss, "xlnx,vidphy");
  2547		if (ret)
  2548			return ret;
  2549		xdprxss->vidphy_prvdata = xdprxss->prvdata;
  2550	
  2551		xdprxss->rx_audio_data =
  2552			devm_kzalloc(&pdev->dev, sizeof(struct xlnx_dprx_audio_data),
  2553				     GFP_KERNEL);
  2554		if (!xdprxss->rx_audio_data)
  2555			return -ENOMEM;
  2556	
  2557		adata = xdprxss->rx_audio_data;
  2558	
  2559		res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "dp_base");
  2560		xdprxss->dp_base = devm_ioremap_resource(dev, res);
  2561		if (IS_ERR(xdprxss->dp_base)) {
  2562			dev_err(dev, "couldn't map DisplayPort registers\n");
  2563			return -ENODEV;
  2564		}
  2565	
  2566		res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "edid_base");
  2567		xdprxss->edid_base = devm_ioremap_resource(dev, res);
  2568		if (IS_ERR(xdprxss->edid_base)) {
  2569			dev_err(dev, "Couldn't map EDID IP memory\n");
  2570			return -ENOENT;
  2571		}
  2572	
  2573		xdprxss->axi_clk = devm_clk_get(dev, "s_axi_aclk");
  2574		if (IS_ERR(xdprxss->axi_clk)) {
  2575			ret = PTR_ERR(xdprxss->axi_clk);
  2576			dev_err(&pdev->dev, "failed to get s_axi_clk (%d)\n", ret);
  2577			return ret;
  2578		}
  2579	
  2580		xdprxss->rx_lnk_clk = devm_clk_get(dev, "rx_lnk_clk");
  2581		if (IS_ERR(xdprxss->rx_lnk_clk)) {
  2582			ret = PTR_ERR(xdprxss->rx_lnk_clk);
  2583			dev_err(&pdev->dev, "failed to get rx_lnk_clk (%d)\n", ret);
  2584			return ret;
  2585		}
  2586	
  2587		xdprxss->rx_vid_clk = devm_clk_get(dev, "rx_vid_clk");
  2588		if (IS_ERR(xdprxss->rx_vid_clk)) {
  2589			ret = PTR_ERR(xdprxss->rx_vid_clk);
  2590			dev_err(&pdev->dev, "failed to get rx_vid_clk (%d)\n", ret);
  2591			return ret;
  2592		}
  2593	
  2594		ret = xdprxss_parse_of(xdprxss);
  2595		if (ret < 0)
  2596			goto clk_err;
  2597	
  2598		if (!xdprxss->versal_gt_present) {
  2599			/* acquire vphy lanes */
  2600			for (i = 0; i < xdprxss->max_lanecount; i++) {
  2601				char phy_name[16];
  2602	
> 2603				snprintf(phy_name, sizeof(phy_name), "dp-phy%u", i);
  2604				xdprxss->phy[i] = devm_phy_get(xdprxss->dev, phy_name);
  2605				if (IS_ERR(xdprxss->phy[i])) {
  2606					ret = PTR_ERR(xdprxss->phy[i]);
  2607					xdprxss->phy[i] = NULL;
  2608					if (ret == -EPROBE_DEFER)
  2609						dev_info(dev, "phy not ready -EPROBE_DEFER\n");
  2610					else
  2611						dev_err(dev,
  2612							"failed to get phy lane %s i %d, ret = %d\n",
  2613							phy_name, i, ret);
  2614					goto error_phy;
  2615				}
  2616				ret = phy_init(xdprxss->phy[i]);
  2617				if (ret) {
  2618					dev_err(dev,
  2619						"failed to init phy lane %d\n", i);
  2620					goto error_phy;
  2621				}
  2622			}
  2623		} else {
  2624			xdprxss->phy[0] = devm_phy_get(xdprxss->dev, "dp-gtquad");
  2625			if (IS_ERR(xdprxss->phy[0]))
  2626				return dev_err_probe(dev, PTR_ERR(xdprxss->phy[0]),
  2627						"failed to get phy\n");
  2628	
  2629			ret = phy_init(xdprxss->phy[0]);
  2630			if (ret) {
  2631				dev_err(dev, "failed to init phy\n");
  2632				goto error_phy;
  2633			}
  2634	
  2635			ret = xlnx_find_device(pdev, xdprxss, "xlnx,xilinx-vfmc");
  2636			if (ret)
  2637				return ret;
  2638	
  2639			ret = xlnx_dp_rx_gt_control_init(xdprxss);
  2640			if (ret < 0)
  2641				return ret;
  2642	
  2643			if (get_rx_dec_clk_lock(xdprxss))
  2644				dev_info(dev, "rx decryption clock failed to lock\n");
  2645		}
  2646	
  2647		ret = clk_prepare_enable(xdprxss->axi_clk);
  2648		if (ret) {
  2649			dev_err(dev, "failed to enable axi_clk (%d)\n", ret);
  2650			goto error_phy;
  2651		}
  2652	
  2653		ret = clk_prepare_enable(xdprxss->rx_lnk_clk);
  2654		if (ret) {
  2655			dev_err(dev, "failed to enable rx_lnk_clk (%d)\n", ret);
  2656			goto rx_lnk_clk_err;
  2657		}
  2658	
  2659		ret = clk_prepare_enable(xdprxss->rx_vid_clk);
  2660		if (ret) {
  2661			dev_err(dev, "failed to enable rx_vid_clk (%d)\n", ret);
  2662			goto rx_vid_clk_err;
  2663		}
  2664	
  2665		spin_lock_init(&xdprxss->lock);
  2666	
  2667		/* Initialize the DP core */
  2668		xdprxss_core_init(xdprxss);
  2669	
  2670		/* Initialize V4L2 subdevice and media entity */
  2671		xdprxss->pad.flags = MEDIA_PAD_FL_SOURCE;
  2672	
  2673		/* Initialize V4L2 subdevice and media entity */
  2674		subdev = &xdprxss->subdev;
  2675		v4l2_subdev_init(subdev, &xdprxss_ops);
  2676		subdev->internal_ops = &xdprxss_internal_ops;
  2677		subdev->dev = &pdev->dev;
  2678		strscpy(subdev->name, dev_name(&pdev->dev), sizeof(subdev->name));
  2679	
  2680		subdev->flags = V4L2_SUBDEV_FL_HAS_EVENTS | V4L2_SUBDEV_FL_HAS_DEVNODE;
  2681	
  2682		subdev->entity.ops = &xdprxss_media_ops;
  2683	
  2684		v4l2_set_subdevdata(subdev, xdprxss);
  2685		ret = media_entity_pads_init(&subdev->entity, 1, &xdprxss->pad);
  2686		if (ret < 0)
  2687			goto error;
  2688	
  2689		ret = v4l2_ctrl_handler_init(&xdprxss->ctrl_handler,
  2690					     ARRAY_SIZE(xdprxss_ctrls));
  2691		if (ret < 0) {
  2692			dev_err(xdprxss->dev, "failed to initialize V4L2 ctrl\n");
  2693			goto error;
  2694		}
  2695	
  2696		for (i = 0; i < ARRAY_SIZE(xdprxss_ctrls); i++) {
  2697			struct v4l2_ctrl *ctrl;
  2698	
  2699			dev_dbg(xdprxss->dev, "%d ctrl = 0x%x\n", i,
  2700				xdprxss_ctrls[i].id);
  2701			ctrl = v4l2_ctrl_new_custom(&xdprxss->ctrl_handler,
  2702						    &xdprxss_ctrls[i], NULL);
  2703			if (!ctrl) {
  2704				dev_err(xdprxss->dev, "Failed for %s ctrl\n",
  2705					xdprxss_ctrls[i].name);
  2706				v4l2_ctrl_handler_free(&xdprxss->ctrl_handler);
  2707				goto error;
  2708			}
  2709		}
  2710	
  2711		if (xdprxss->ctrl_handler.error) {
  2712			dev_err(xdprxss->dev, "failed to add controls\n");
  2713			ret = xdprxss->ctrl_handler.error;
  2714			v4l2_ctrl_handler_free(&xdprxss->ctrl_handler);
  2715			goto error;
  2716		}
  2717	
  2718		subdev->ctrl_handler = &xdprxss->ctrl_handler;
  2719		ret = v4l2_ctrl_handler_setup(&xdprxss->ctrl_handler);
  2720		if (ret < 0) {
  2721			dev_err(xdprxss->dev, "failed to set controls\n");
  2722			goto error;
  2723		}
  2724	
  2725		/* Register interrupt handler */
  2726		irq = irq_of_parse_and_map(node, 0);
  2727		ret = devm_request_irq(xdprxss->dev, irq, xdprxss_irq_handler,
  2728				       IRQF_SHARED, subdev->name, xdprxss);
  2729		if (ret) {
  2730			dev_err(dev, "Err = %d Interrupt handler reg failed!\n",
  2731				ret);
  2732			goto error;
  2733		}
  2734	
  2735		platform_set_drvdata(pdev, xdprxss);
  2736	
  2737		ret = v4l2_async_register_subdev(subdev);
  2738		if (ret < 0) {
  2739			dev_err(dev, "failed to register subdev\n");
  2740			goto error;
  2741		}
  2742	
  2743		if (xdprxss->audio_enable) {
  2744			ret = dprx_register_aud_dev(xdprxss->dev);
  2745			if (ret < 0) {
  2746				xdprxss->audio_init = false;
  2747				dev_err(xdprxss->dev, "dp rx audio init failed\n");
  2748				goto error;
  2749			} else {
  2750				xdprxss->audio_init = true;
  2751				init_waitqueue_head(&adata->audio_update_q);
  2752				dev_info(xdprxss->dev, "dp rx audio initialized\n");
  2753			}
  2754		}
  2755	
  2756		if (xdprxss->hdcp_enable) {
  2757			xdprxss->hdcp1x_keymgmt_base = syscon_regmap_lookup_by_phandle(node,
  2758										       "xlnx,hdcp1x_keymgmt");
  2759			if (IS_ERR(xdprxss->hdcp1x_keymgmt_base)) {
  2760				dev_err(dev, "couldn't map hdcp1x Keymgmt registers\n");
  2761				return -ENODEV;
  2762			}
  2763	
  2764			ret = dprx_register_hdcp1x_dev(xdprxss);
  2765			if (ret < 0) {
  2766				dev_err(xdprxss->dev, "dp rx hdcp1x init failed\n");
  2767				goto error;
  2768			}
  2769	
  2770			irq = platform_get_irq_byname(pdev, "dprxss_hdcp_irq");
  2771			ret = devm_request_irq(xdprxss->dev, irq,
  2772					       xdprxss_hdcp1x_irq_handler,
  2773					       IRQF_SHARED, "dprxss_hdcp_irq", xdprxss);
  2774			if (ret) {
  2775				dev_err(dev, "err: hdcp1x interrupt registration failed!\n");
  2776				goto error;
  2777			}
  2778	
  2779			/* Enable HDCP1x Interrupts */
  2780			xdprxss_enable_hdcp1x_interrupts(xdprxss);
  2781		}
  2782	
  2783		INIT_DELAYED_WORK(&xdprxss->tp1_work, xlnx_dp_tp1_work_func);
  2784		INIT_DELAYED_WORK(&xdprxss->unplug_work, xlnx_dp_unplug_work_func);
  2785		INIT_WORK(&xdprxss->lane_set_work, xlnx_dp_laneset_work_func);
  2786		INIT_WORK(&xdprxss->link_qual_work, xlnx_dp_linkqual_work_func);
  2787	
  2788		return 0;
  2789	
  2790	error:
  2791		media_entity_cleanup(&subdev->entity);
  2792	clk_err:
  2793		clk_disable_unprepare(xdprxss->rx_vid_clk);
  2794	rx_vid_clk_err:
  2795		clk_disable_unprepare(xdprxss->rx_lnk_clk);
  2796	rx_lnk_clk_err:
  2797		clk_disable_unprepare(xdprxss->axi_clk);
  2798	error_phy:
  2799		dev_dbg(dev, " %s error_phy:\n", __func__);
  2800		/* release the lanes that we did get, if we did not get all lanes */
  2801		if (!xdprxss->versal_gt_present) {
  2802			for (j = 0; j < i; j++) {
  2803				if (xdprxss->phy[j]) {
  2804					dev_dbg(dev,
  2805						"phy_exit() xdprxss->phy[%d] = %p\n",
  2806						j, xdprxss->phy[j]);
  2807					phy_exit(xdprxss->phy[j]);
  2808				}
  2809			}
  2810		} else {
  2811			phy_exit(xdprxss->phy[0]);
  2812		}
  2813	
  2814		return ret;
  2815	}
  2816	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
