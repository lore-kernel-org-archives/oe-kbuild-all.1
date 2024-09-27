Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 999C323B0
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Sep 2024 16:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727454521; cv=none; b=cOVF8sw6fAhF6PjfosvA+FWGHny31hTQv2sAiT5MkkpS5ftx4jlczYzSmydb5TLavpH1xT2boytmD8tk61uPWxIEucXnvwPRexgnhrRrV02azErp3WUysJbIWXfsA9uC/q+cF13bxdjaMhWnGtqThEZE4WlnQpCYMT0OAfLdcSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727454521; c=relaxed/simple;
	bh=fGpHEf7d9QSH//2gjdJ6fWNFGi3WSwulhEh0PeG44QY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K7EBr2s2Pmv62ueXYvsHWdBi06lcLut+tABfWBn8BeX6KWoWTTIWW0V2BYR5qrP9L0/3o8z5gJVn8YCN5Gt6sWT5MfVyI825+qMvhZZ98ORvrQcppTq4MR3KOKJ6XZfIxjy9+VYbNXXlMHucHcdjZGpE3hQLi1ol1zivDsG63HM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HQD5oHFQ; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HQD5oHFQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727454520; x=1758990520;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fGpHEf7d9QSH//2gjdJ6fWNFGi3WSwulhEh0PeG44QY=;
  b=HQD5oHFQuJEjIKqRM8DNyRLSV6euihUC1j/NEZDaqJ0Y09Xj9Z5EEb6u
   PGTPt70hs2yrsgGGkZ+wwRwMh+BBkyqLjUxTu3eCO0/2kKTQpOv4eG7gK
   DduU2KI8i3KriUnH+oXSo3aZY8YFdz6QDmE2mSCKBXEyHDhxg6ngEBiBe
   5v+sQtIBXGPLIGPJi7/43ZkBKblO4rphBTRxZUez7AP6qLxs5N1Sn6PBd
   Jna5h/zoTsag4uJVBKrRxoRwpfHf0If5iLvXIPG+sbzbeoXHEZ1Egp3i5
   vtBum7THxQn0YR9Mhe4PgAWkQfWRV36QMvJhkUAE3jPVw9dn3N6QqGXgC
   g==;
X-CSE-ConnectionGUID: uMdJaRJkSxa/B1/zQEcFFQ==
X-CSE-MsgGUID: qwqjX3/hSTyJSg9F8G1Ujg==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="30398018"
X-IronPort-AV: E=Sophos;i="6.11,159,1725346800"; 
   d="scan'208";a="30398018"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 09:28:35 -0700
X-CSE-ConnectionGUID: hEu190BVTC6UaPmiH0aIXw==
X-CSE-MsgGUID: 7R7v/3uDR1e2NupApDcYTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,159,1725346800"; 
   d="scan'208";a="72892754"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 27 Sep 2024 09:28:33 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suDpW-000MO7-3B;
	Fri, 27 Sep 2024 16:28:30 +0000
Date: Sat, 28 Sep 2024 00:28:17 +0800
From: kernel test robot <lkp@intel.com>
To: Kunal Rane <kunal.rane@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Vishal Sagar <vishal.sagar@amd.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.6_LTS_2024.1_update 853/1001]
 drivers/media/platform/xilinx/xilinx-dprxss.c:2948:71: warning: 'snprintf'
 output may be truncated before the last format character
Message-ID: <202409280015.Sj1oVQoK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.6_LTS_2024.1_update
head:   5365c13a86998da06d845c918f849b30b8735538
commit: de5f9c938d59eea99c637ab99fe8a21e59aacaa8 [853/1001] v4l: xilinx: dprxss: Fix cppcheck warnings
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20240928/202409280015.Sj1oVQoK-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240928/202409280015.Sj1oVQoK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409280015.Sj1oVQoK-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/platform/xilinx/xilinx-dprxss.c: In function 'xdprxss_probe':
>> drivers/media/platform/xilinx/xilinx-dprxss.c:2948:71: warning: 'snprintf' output may be truncated before the last format character [-Wformat-truncation=]
    2948 |                         snprintf(phy_name, sizeof(phy_name), "dp-phy%u", i);
         |                                                                       ^
   drivers/media/platform/xilinx/xilinx-dprxss.c:2948:25: note: 'snprintf' output between 8 and 17 bytes into a destination of size 16
    2948 |                         snprintf(phy_name, sizeof(phy_name), "dp-phy%u", i);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/snprintf +2948 drivers/media/platform/xilinx/xilinx-dprxss.c

  2867	
  2868	static int xdprxss_probe(struct platform_device *pdev)
  2869	{
  2870		struct v4l2_subdev *subdev;
  2871		struct xdprxss_state *xdprxss;
  2872		struct device_node *node;
  2873		struct device *dev = &pdev->dev;
  2874		struct resource *res;
  2875		int ret, irq;
  2876		unsigned int i = 0, j;
  2877		struct xlnx_dprx_audio_data *adata;
  2878	
  2879		xdprxss = devm_kzalloc(dev, sizeof(*xdprxss), GFP_KERNEL);
  2880		if (!xdprxss)
  2881			return -ENOMEM;
  2882	
  2883		xdprxss->dev = &pdev->dev;
  2884		node = xdprxss->dev->of_node;
  2885	
  2886		ret = xlnx_find_device(pdev, xdprxss, "xlnx,dp-retimer");
  2887		if (ret)
  2888			return ret;
  2889		xdprxss->retimer_prvdata = xdprxss->prvdata;
  2890	
  2891		ret = xlnx_find_device(pdev, xdprxss, "xlnx,vidphy");
  2892		if (ret)
  2893			return ret;
  2894		xdprxss->vidphy_prvdata = xdprxss->prvdata;
  2895	
  2896		xdprxss->rx_audio_data =
  2897			devm_kzalloc(&pdev->dev, sizeof(struct xlnx_dprx_audio_data),
  2898				     GFP_KERNEL);
  2899		if (!xdprxss->rx_audio_data)
  2900			return -ENOMEM;
  2901	
  2902		adata = xdprxss->rx_audio_data;
  2903	
  2904		res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "dp_base");
  2905		xdprxss->dp_base = devm_ioremap_resource(dev, res);
  2906		if (IS_ERR(xdprxss->dp_base)) {
  2907			dev_err(dev, "couldn't map DisplayPort registers\n");
  2908			return -ENODEV;
  2909		}
  2910	
  2911		res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "edid_base");
  2912		xdprxss->edid_base = devm_ioremap_resource(dev, res);
  2913		if (IS_ERR(xdprxss->edid_base)) {
  2914			dev_err(dev, "Couldn't map EDID IP memory\n");
  2915			return -ENOENT;
  2916		}
  2917	
  2918		xdprxss->axi_clk = devm_clk_get(dev, "s_axi_aclk");
  2919		if (IS_ERR(xdprxss->axi_clk)) {
  2920			ret = PTR_ERR(xdprxss->axi_clk);
  2921			dev_err(&pdev->dev, "failed to get s_axi_clk (%d)\n", ret);
  2922			return ret;
  2923		}
  2924	
  2925		xdprxss->rx_lnk_clk = devm_clk_get(dev, "rx_lnk_clk");
  2926		if (IS_ERR(xdprxss->rx_lnk_clk)) {
  2927			ret = PTR_ERR(xdprxss->rx_lnk_clk);
  2928			dev_err(&pdev->dev, "failed to get rx_lnk_clk (%d)\n", ret);
  2929			return ret;
  2930		}
  2931	
  2932		xdprxss->rx_vid_clk = devm_clk_get(dev, "rx_vid_clk");
  2933		if (IS_ERR(xdprxss->rx_vid_clk)) {
  2934			ret = PTR_ERR(xdprxss->rx_vid_clk);
  2935			dev_err(&pdev->dev, "failed to get rx_vid_clk (%d)\n", ret);
  2936			return ret;
  2937		}
  2938	
  2939		ret = xdprxss_parse_of(xdprxss);
  2940		if (ret < 0)
  2941			goto clk_err;
  2942	
  2943		if (!xdprxss->versal_gt_present) {
  2944			/* acquire vphy lanes */
  2945			for (i = 0; i < xdprxss->max_lanecount; i++) {
  2946				char phy_name[16];
  2947	
> 2948				snprintf(phy_name, sizeof(phy_name), "dp-phy%u", i);
  2949				xdprxss->phy[i] = devm_phy_get(xdprxss->dev, phy_name);
  2950				if (IS_ERR(xdprxss->phy[i])) {
  2951					ret = PTR_ERR(xdprxss->phy[i]);
  2952					xdprxss->phy[i] = NULL;
  2953					if (ret == -EPROBE_DEFER)
  2954						dev_info(dev, "phy not ready -EPROBE_DEFER\n");
  2955					else
  2956						dev_err(dev,
  2957							"failed to get phy lane %s i %d, ret = %d\n",
  2958							phy_name, i, ret);
  2959					goto error_phy;
  2960				}
  2961				ret = phy_init(xdprxss->phy[i]);
  2962				if (ret) {
  2963					dev_err(dev,
  2964						"failed to init phy lane %d\n", i);
  2965					goto error_phy;
  2966				}
  2967			}
  2968		} else {
  2969			xdprxss->phy[0] = devm_phy_get(xdprxss->dev, "dp-gtquad");
  2970			if (IS_ERR(xdprxss->phy[0]))
  2971				return dev_err_probe(dev, PTR_ERR(xdprxss->phy[0]),
  2972						"failed to get phy\n");
  2973	
  2974			ret = phy_init(xdprxss->phy[0]);
  2975			if (ret) {
  2976				dev_err(dev, "failed to init phy\n");
  2977				goto error_phy;
  2978			}
  2979	
  2980			ret = xlnx_find_device(pdev, xdprxss, "xlnx,xilinx-vfmc");
  2981			if (ret)
  2982				return ret;
  2983	
  2984			ret = xlnx_dp_rx_gt_control_init(xdprxss);
  2985			if (ret < 0)
  2986				return ret;
  2987	
  2988			if (get_rx_dec_clk_lock(xdprxss))
  2989				dev_info(dev, "rx decryption clock failed to lock\n");
  2990		}
  2991	
  2992		ret = clk_prepare_enable(xdprxss->axi_clk);
  2993		if (ret) {
  2994			dev_err(dev, "failed to enable axi_clk (%d)\n", ret);
  2995			goto error_phy;
  2996		}
  2997	
  2998		ret = clk_prepare_enable(xdprxss->rx_lnk_clk);
  2999		if (ret) {
  3000			dev_err(dev, "failed to enable rx_lnk_clk (%d)\n", ret);
  3001			goto rx_lnk_clk_err;
  3002		}
  3003	
  3004		ret = clk_prepare_enable(xdprxss->rx_vid_clk);
  3005		if (ret) {
  3006			dev_err(dev, "failed to enable rx_vid_clk (%d)\n", ret);
  3007			goto rx_vid_clk_err;
  3008		}
  3009	
  3010		spin_lock_init(&xdprxss->lock);
  3011	
  3012		/* Initialize the DP core */
  3013		xdprxss_core_init(xdprxss);
  3014	
  3015		/* Initialize V4L2 subdevice and media entity */
  3016		xdprxss->pad.flags = MEDIA_PAD_FL_SOURCE;
  3017	
  3018		/* Initialize V4L2 subdevice and media entity */
  3019		subdev = &xdprxss->subdev;
  3020		v4l2_subdev_init(subdev, &xdprxss_ops);
  3021		subdev->dev = &pdev->dev;
  3022		strscpy(subdev->name, dev_name(&pdev->dev), sizeof(subdev->name));
  3023	
  3024		subdev->flags = V4L2_SUBDEV_FL_HAS_EVENTS | V4L2_SUBDEV_FL_HAS_DEVNODE;
  3025	
  3026		subdev->entity.ops = &xdprxss_media_ops;
  3027	
  3028		v4l2_set_subdevdata(subdev, xdprxss);
  3029		ret = media_entity_pads_init(&subdev->entity, 1, &xdprxss->pad);
  3030		if (ret < 0)
  3031			goto error;
  3032	
  3033		ret = v4l2_ctrl_handler_init(&xdprxss->ctrl_handler,
  3034					     ARRAY_SIZE(xdprxss_ctrls));
  3035		if (ret < 0) {
  3036			dev_err(xdprxss->dev, "failed to initialize V4L2 ctrl\n");
  3037			goto error;
  3038		}
  3039	
  3040		for (i = 0; i < ARRAY_SIZE(xdprxss_ctrls); i++) {
  3041			struct v4l2_ctrl *ctrl;
  3042	
  3043			dev_dbg(xdprxss->dev, "%d ctrl = 0x%x\n", i,
  3044				xdprxss_ctrls[i].id);
  3045			ctrl = v4l2_ctrl_new_custom(&xdprxss->ctrl_handler,
  3046						    &xdprxss_ctrls[i], NULL);
  3047			if (!ctrl) {
  3048				dev_err(xdprxss->dev, "Failed for %s ctrl\n",
  3049					xdprxss_ctrls[i].name);
  3050				v4l2_ctrl_handler_free(&xdprxss->ctrl_handler);
  3051				goto error;
  3052			}
  3053		}
  3054	
  3055		if (xdprxss->ctrl_handler.error) {
  3056			dev_err(xdprxss->dev, "failed to add controls\n");
  3057			ret = xdprxss->ctrl_handler.error;
  3058			v4l2_ctrl_handler_free(&xdprxss->ctrl_handler);
  3059			goto error;
  3060		}
  3061	
  3062		subdev->ctrl_handler = &xdprxss->ctrl_handler;
  3063		ret = v4l2_ctrl_handler_setup(&xdprxss->ctrl_handler);
  3064		if (ret < 0) {
  3065			dev_err(xdprxss->dev, "failed to set controls\n");
  3066			goto error;
  3067		}
  3068	
  3069		/* Register interrupt handler */
  3070		irq = irq_of_parse_and_map(node, 0);
  3071		ret = devm_request_irq(xdprxss->dev, irq, xdprxss_irq_handler,
  3072				       IRQF_SHARED, subdev->name, xdprxss);
  3073		if (ret) {
  3074			dev_err(dev, "Err = %d Interrupt handler reg failed!\n",
  3075				ret);
  3076			goto error;
  3077		}
  3078	
  3079		platform_set_drvdata(pdev, xdprxss);
  3080	
  3081		ret = v4l2_async_register_subdev(subdev);
  3082		if (ret < 0) {
  3083			dev_err(dev, "failed to register subdev\n");
  3084			goto error;
  3085		}
  3086	
  3087		if (xdprxss->audio_enable) {
  3088			ret = dprx_register_aud_dev(xdprxss->dev);
  3089			if (ret < 0) {
  3090				xdprxss->audio_init = false;
  3091				dev_err(xdprxss->dev, "dp rx audio init failed\n");
  3092				goto error;
  3093			} else {
  3094				xdprxss->audio_init = true;
  3095				init_waitqueue_head(&adata->audio_update_q);
  3096				dev_info(xdprxss->dev, "dp rx audio initialized\n");
  3097			}
  3098		}
  3099	
  3100		if (xdprxss->hdcp22_enable) {
  3101			ret = dprx_register_hdcp2x_dev(xdprxss, pdev);
  3102			if (ret < 0) {
  3103				dev_err(xdprxss->dev, "dp rx hdcp2/x init failed\n");
  3104				goto error;
  3105			}
  3106			xdprxss_enable_hdcp2x_interrupts(xdprxss);
  3107		}
  3108	
  3109		if (xdprxss->hdcp_enable) {
  3110			xdprxss->hdcp1x_keymgmt_base = syscon_regmap_lookup_by_phandle(node,
  3111										       "xlnx,hdcp1x_keymgmt");
  3112			if (IS_ERR(xdprxss->hdcp1x_keymgmt_base)) {
  3113				dev_err(dev, "couldn't map hdcp1x Keymgmt registers\n");
  3114				return -ENODEV;
  3115			}
  3116	
  3117			ret = dprx_register_hdcp1x_dev(xdprxss);
  3118			if (ret < 0) {
  3119				dev_err(xdprxss->dev, "dp rx hdcp1x init failed\n");
  3120				goto error;
  3121			}
  3122	
  3123			irq = irq_of_parse_and_map(node, 2);
  3124			ret = devm_request_irq(xdprxss->dev, irq,
  3125					       xdprxss_hdcp1x_irq_handler,
  3126					       IRQF_SHARED, "dprxss_hdcp1x", xdprxss);
  3127			if (ret) {
  3128				dev_err(dev, "err: hdcp1x interrupt registration failed!\n");
  3129				goto error;
  3130			}
  3131	
  3132			/* Enable HDCP1x Interrupts */
  3133			xdprxss_enable_hdcp1x_interrupts(xdprxss);
  3134		}
  3135	
  3136		INIT_DELAYED_WORK(&xdprxss->tp1_work, xlnx_dp_tp1_work_func);
  3137		INIT_DELAYED_WORK(&xdprxss->unplug_work, xlnx_dp_unplug_work_func);
  3138		INIT_WORK(&xdprxss->lane_set_work, xlnx_dp_laneset_work_func);
  3139		INIT_WORK(&xdprxss->link_qual_work, xlnx_dp_linkqual_work_func);
  3140	
  3141		return 0;
  3142	
  3143	error:
  3144		media_entity_cleanup(&subdev->entity);
  3145	clk_err:
  3146		clk_disable_unprepare(xdprxss->rx_vid_clk);
  3147	rx_vid_clk_err:
  3148		clk_disable_unprepare(xdprxss->rx_lnk_clk);
  3149	rx_lnk_clk_err:
  3150		clk_disable_unprepare(xdprxss->axi_clk);
  3151	error_phy:
  3152		dev_dbg(dev, " %s error_phy:\n", __func__);
  3153		/* release the lanes that we did get, if we did not get all lanes */
  3154		if (!xdprxss->versal_gt_present) {
  3155			for (j = 0; j < i; j++) {
  3156				if (xdprxss->phy[j]) {
  3157					dev_dbg(dev,
  3158						"phy_exit() xdprxss->phy[%d] = %p\n",
  3159						j, xdprxss->phy[j]);
  3160					phy_exit(xdprxss->phy[j]);
  3161				}
  3162			}
  3163		} else {
  3164			phy_exit(xdprxss->phy[0]);
  3165		}
  3166	
  3167		return ret;
  3168	}
  3169	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
