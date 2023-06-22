Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C81771D2D1
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Jun 2023 13:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687441723; x=1718977723;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GhnrKJaF8R5UNNStSK+GSnntQZdoAFZI3khx9Fi9ywE=;
  b=MNsNlumqPh/4db/LgEEDcTPxBMow2qbE5JXaIATmfln2vbFTu9HshGFl
   OtkeiBHfqN922/jdpqwnjH6g6Vb00gMfLFynCZYclO4W8ZhKAok/XkquH
   h4+yp4M/CtVZRa+2YH2BIVfC8dVkaUQ0cpdsmzU629x9CvXvGnq7jd8Hn
   WPZybq+GtgqG46QUkQZ3CwGP3SEmCU8+n6voIoF0LpWUL4rdNpLUGtEbX
   pD14DSgBsXeKW3P8XHUj436pMsYtXM6id/x6zYEmUUsi5oQM6UVzUrrIj
   lZJfz+zH2Nsj2ERO5DPBR28BYejaF/KzANNA+koxbulN+GOX2D9s1xpJ/
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="424161255"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200"; 
   d="scan'208";a="424161255"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2023 06:17:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="804780804"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200"; 
   d="scan'208";a="804780804"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 22 Jun 2023 06:17:38 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qCKBu-0007Yp-0q;
	Thu, 22 Jun 2023 13:17:38 +0000
Date: Thu, 22 Jun 2023 21:17:08 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-1.0.x-imx 195/9881]
 drivers/media/platform/imx8/mxc-mipi-csi2_yav.c:412:46: warning:
 'mipi_csi2_sd_internal_ops' defined but not used
Message-ID: <202306222101.zmu5LzQl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.1-1.0.x-imx
head:   3260d1af47b1bedfe12b79a26efa184b9a60a8a3
commit: 038f3061d82c82b6406a3c90ccd1f566d2f103f7 [195/9881] media: mipi csi: add mixel's mipi csi driver
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20230622/202306222101.zmu5LzQl-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230622/202306222101.zmu5LzQl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306222101.zmu5LzQl-lkp@intel.com/

All warnings (new ones prefixed by >>):

         |                                                        ^~
   drivers/media/platform/imx8/mxc-mipi-csi2_yav.c:401:16: note: in expansion of macro 'v4l2_subdev_call'
     401 |         return v4l2_subdev_call(sensor_sd, video, s_parm, a);
         |                ^~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:1408:53: error: 'const struct v4l2_subdev_video_ops' has no member named 's_parm'
    1408 |                          v4l2_subdev_call_wrappers.o->f)                \
         |                                                     ^~
   drivers/media/platform/imx8/mxc-mipi-csi2_yav.c:401:16: note: in expansion of macro 'v4l2_subdev_call'
     401 |         return v4l2_subdev_call(sensor_sd, video, s_parm, a);
         |                ^~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:1409:63: error: 'const struct v4l2_subdev_video_ops' has no member named 's_parm'
    1409 |                         __result = v4l2_subdev_call_wrappers.o->f(      \
         |                                                               ^~
   drivers/media/platform/imx8/mxc-mipi-csi2_yav.c:401:16: note: in expansion of macro 'v4l2_subdev_call'
     401 |         return v4l2_subdev_call(sensor_sd, video, s_parm, a);
         |                ^~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:1412:48: error: 'const struct v4l2_subdev_video_ops' has no member named 's_parm'
    1412 |                         __result = __sd->ops->o->f(__sd, ##args);       \
         |                                                ^~
   drivers/media/platform/imx8/mxc-mipi-csi2_yav.c:401:16: note: in expansion of macro 'v4l2_subdev_call'
     401 |         return v4l2_subdev_call(sensor_sd, video, s_parm, a);
         |                ^~~~~~~~~~~~~~~~
   drivers/media/platform/imx8/mxc-mipi-csi2_yav.c: In function 'mipi_csis_g_parm':
   include/media/v4l2-subdev.h:1405:56: error: 'const struct v4l2_subdev_video_ops' has no member named 'g_parm'
    1405 |                 else if (!(__sd->ops->o && __sd->ops->o->f))            \
         |                                                        ^~
   drivers/media/platform/imx8/mxc-mipi-csi2_yav.c:409:16: note: in expansion of macro 'v4l2_subdev_call'
     409 |         return v4l2_subdev_call(sensor_sd, video, g_parm, a);
         |                ^~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:1408:53: error: 'const struct v4l2_subdev_video_ops' has no member named 'g_parm'
    1408 |                          v4l2_subdev_call_wrappers.o->f)                \
         |                                                     ^~
   drivers/media/platform/imx8/mxc-mipi-csi2_yav.c:409:16: note: in expansion of macro 'v4l2_subdev_call'
     409 |         return v4l2_subdev_call(sensor_sd, video, g_parm, a);
         |                ^~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:1409:63: error: 'const struct v4l2_subdev_video_ops' has no member named 'g_parm'
    1409 |                         __result = v4l2_subdev_call_wrappers.o->f(      \
         |                                                               ^~
   drivers/media/platform/imx8/mxc-mipi-csi2_yav.c:409:16: note: in expansion of macro 'v4l2_subdev_call'
     409 |         return v4l2_subdev_call(sensor_sd, video, g_parm, a);
         |                ^~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:1412:48: error: 'const struct v4l2_subdev_video_ops' has no member named 'g_parm'
    1412 |                         __result = __sd->ops->o->f(__sd, ##args);       \
         |                                                ^~
   drivers/media/platform/imx8/mxc-mipi-csi2_yav.c:409:16: note: in expansion of macro 'v4l2_subdev_call'
     409 |         return v4l2_subdev_call(sensor_sd, video, g_parm, a);
         |                ^~~~~~~~~~~~~~~~
   drivers/media/platform/imx8/mxc-mipi-csi2_yav.c: At top level:
   drivers/media/platform/imx8/mxc-mipi-csi2_yav.c:417:28: error: initialization of 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_frame_size_enum *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_pad_config *, struct v4l2_subdev_frame_size_enum *)' [-Werror=incompatible-pointer-types]
     417 |         .enum_frame_size = mipi_csis_enum_framesizes,
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imx8/mxc-mipi-csi2_yav.c:417:28: note: (near initialization for 'mipi_csi2_pad_ops.enum_frame_size')
   drivers/media/platform/imx8/mxc-mipi-csi2_yav.c:418:32: error: initialization of 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_frame_interval_enum *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_pad_config *, struct v4l2_subdev_frame_interval_enum *)' [-Werror=incompatible-pointer-types]
     418 |         .enum_frame_interval = mipi_csis_enum_frameintervals,
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imx8/mxc-mipi-csi2_yav.c:418:32: note: (near initialization for 'mipi_csi2_pad_ops.enum_frame_interval')
   drivers/media/platform/imx8/mxc-mipi-csi2_yav.c:419:27: error: initialization of 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_mbus_code_enum *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_pad_config *, struct v4l2_subdev_mbus_code_enum *)' [-Werror=incompatible-pointer-types]
     419 |         .enum_mbus_code = mipi_csis_enum_mbus_code,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imx8/mxc-mipi-csi2_yav.c:419:27: note: (near initialization for 'mipi_csi2_pad_ops.enum_mbus_code')
   drivers/media/platform/imx8/mxc-mipi-csi2_yav.c:420:20: error: initialization of 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_pad_config *, struct v4l2_subdev_format *)' [-Werror=incompatible-pointer-types]
     420 |         .get_fmt = mipi_csi2_get_fmt,
         |                    ^~~~~~~~~~~~~~~~~
   drivers/media/platform/imx8/mxc-mipi-csi2_yav.c:420:20: note: (near initialization for 'mipi_csi2_pad_ops.get_fmt')
   drivers/media/platform/imx8/mxc-mipi-csi2_yav.c:421:20: error: initialization of 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_pad_config *, struct v4l2_subdev_format *)' [-Werror=incompatible-pointer-types]
     421 |         .set_fmt = mipi_csi2_set_fmt,
         |                    ^~~~~~~~~~~~~~~~~
   drivers/media/platform/imx8/mxc-mipi-csi2_yav.c:421:20: note: (near initialization for 'mipi_csi2_pad_ops.set_fmt')
   drivers/media/platform/imx8/mxc-mipi-csi2_yav.c:431:10: error: 'struct v4l2_subdev_video_ops' has no member named 's_parm'
     431 |         .s_parm = mipi_csis_s_parm,
         |          ^~~~~~
   drivers/media/platform/imx8/mxc-mipi-csi2_yav.c:431:19: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
     431 |         .s_parm = mipi_csis_s_parm,
         |                   ^~~~~~~~~~~~~~~~
   drivers/media/platform/imx8/mxc-mipi-csi2_yav.c:431:19: note: (near initialization for 'mipi_csi2_video_ops')
   drivers/media/platform/imx8/mxc-mipi-csi2_yav.c:431:19: error: initialization of 'int (*)(struct v4l2_subdev *, struct v4l2_dv_timings *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_streamparm *)' [-Werror=incompatible-pointer-types]
   drivers/media/platform/imx8/mxc-mipi-csi2_yav.c:431:19: note: (near initialization for 'mipi_csi2_video_ops.s_dv_timings')
   drivers/media/platform/imx8/mxc-mipi-csi2_yav.c:432:10: error: 'struct v4l2_subdev_video_ops' has no member named 'g_parm'
     432 |         .g_parm = mipi_csis_g_parm,
         |          ^~~~~~
   drivers/media/platform/imx8/mxc-mipi-csi2_yav.c:432:19: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
     432 |         .g_parm = mipi_csis_g_parm,
         |                   ^~~~~~~~~~~~~~~~
   drivers/media/platform/imx8/mxc-mipi-csi2_yav.c:432:19: note: (near initialization for 'mipi_csi2_video_ops')
   drivers/media/platform/imx8/mxc-mipi-csi2_yav.c:432:19: error: initialization of 'int (*)(struct v4l2_subdev *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_streamparm *)' [-Werror=incompatible-pointer-types]
   drivers/media/platform/imx8/mxc-mipi-csi2_yav.c:432:19: note: (near initialization for 'mipi_csi2_video_ops.post_streamoff')
   drivers/media/platform/imx8/mxc-mipi-csi2_yav.c: In function 'mipi_csis_subdev_host':
   drivers/media/platform/imx8/mxc-mipi-csi2_yav.c:507:9: error: implicit declaration of function 'v4l2_async_notifier_init'; did you mean 'v4l2_async_nf_init'? [-Werror=implicit-function-declaration]
     507 |         v4l2_async_notifier_init(&csi2dev->subdev_notifier);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
         |         v4l2_async_nf_init
   drivers/media/platform/imx8/mxc-mipi-csi2_yav.c:539:9: error: implicit declaration of function 'v4l2_async_notifier_add_subdev'; did you mean 'v4l2_async_register_subdev'? [-Werror=implicit-function-declaration]
     539 |         v4l2_async_notifier_add_subdev(&csi2dev->subdev_notifier,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |         v4l2_async_register_subdev
   drivers/media/platform/imx8/mxc-mipi-csi2_yav.c:545:15: error: implicit declaration of function 'v4l2_async_notifier_register'; did you mean 'v4l2_async_nf_register'? [-Werror=implicit-function-declaration]
     545 |         ret = v4l2_async_notifier_register(&csi2dev->v4l2_dev,
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |               v4l2_async_nf_register
   drivers/media/platform/imx8/mxc-mipi-csi2_yav.c: At top level:
>> drivers/media/platform/imx8/mxc-mipi-csi2_yav.c:412:46: warning: 'mipi_csi2_sd_internal_ops' defined but not used [-Wunused-const-variable=]
     412 | static const struct v4l2_subdev_internal_ops mipi_csi2_sd_internal_ops = {
         |                                              ^~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/mipi_csi2_sd_internal_ops +412 drivers/media/platform/imx8/mxc-mipi-csi2_yav.c

   411	
 > 412	static const struct v4l2_subdev_internal_ops mipi_csi2_sd_internal_ops = {
   413		.open = mipi_csi2_open,
   414	};
   415	
   416	static struct v4l2_subdev_pad_ops mipi_csi2_pad_ops = {
   417		.enum_frame_size = mipi_csis_enum_framesizes,
   418		.enum_frame_interval = mipi_csis_enum_frameintervals,
   419		.enum_mbus_code = mipi_csis_enum_mbus_code,
   420		.get_fmt = mipi_csi2_get_fmt,
   421		.set_fmt = mipi_csi2_set_fmt,
   422	};
   423	
   424	static struct v4l2_subdev_core_ops mipi_csi2_core_ops = {
   425		.s_power = mipi_csi2_s_power,
   426	};
   427	
   428	static struct v4l2_subdev_video_ops mipi_csi2_video_ops = {
   429		.s_stream = mipi_csi2_s_stream,
   430	
   431		.s_parm = mipi_csis_s_parm,
   432		.g_parm = mipi_csis_g_parm,
   433	};
   434	
   435	static struct v4l2_subdev_ops mipi_csi2_subdev_ops = {
   436		.core = &mipi_csi2_core_ops,
   437		.video = &mipi_csi2_video_ops,
   438		.pad = &mipi_csi2_pad_ops,
   439	};
   440	
   441	static int mipi_csi2_parse_dt(struct mxc_mipi_csi2_dev *csi2dev)
   442	{
   443		struct device *dev = &csi2dev->pdev->dev;
   444		struct device_node *node = dev->of_node;
   445		struct v4l2_fwnode_endpoint endpoint;
   446		u32 i;
   447	
   448		csi2dev->id = of_alias_get_id(node, "csi");
   449	
   450		csi2dev->vchannel = of_property_read_bool(node, "virtual-channel");
   451	
   452		node = of_graph_get_next_endpoint(node, NULL);
   453		if (!node) {
   454			dev_err(dev, "No port node at %s\n", node->full_name);
   455			return -EINVAL;
   456		}
   457	
   458		/* Get port node */
   459		memset(&endpoint, 0x0, sizeof(endpoint));
   460		v4l2_fwnode_endpoint_parse(of_fwnode_handle(node), &endpoint);
   461	
   462		csi2dev->num_lanes = endpoint.bus.mipi_csi2.num_data_lanes;
   463		for (i = 0; i < csi2dev->num_lanes; i++)
   464			csi2dev->data_lanes[i] = endpoint.bus.mipi_csi2.data_lanes[i];
   465	
   466		of_node_put(node);
   467	
   468		return 0;
   469	}
   470	
   471	static inline struct mxc_mipi_csi2_dev
   472	*notifier_to_mipi_dev(struct v4l2_async_notifier *n)
   473	{
   474		return container_of(n, struct mxc_mipi_csi2_dev, subdev_notifier);
   475	}
   476	
   477	static int subdev_notifier_bound(struct v4l2_async_notifier *notifier,
   478					 struct v4l2_subdev *subdev,
   479					 struct v4l2_async_subdev *asd)
   480	{
   481		struct mxc_mipi_csi2_dev *csi2dev = notifier_to_mipi_dev(notifier);
   482	
   483		/* Find platform data for this sensor subdev */
   484		if (csi2dev->asd.match.fwnode == of_fwnode_handle(subdev->dev->of_node))
   485			csi2dev->sensor_sd = subdev;
   486	
   487		if (subdev == NULL)
   488			return -EINVAL;
   489	
   490		v4l2_info(&csi2dev->v4l2_dev, "Registered sensor subdevice: %s\n",
   491			  subdev->name);
   492	
   493		return 0;
   494	}
   495	
   496	static const struct v4l2_async_notifier_operations subdev_notifier_ops = {
   497		.bound = subdev_notifier_bound,
   498	};
   499	
   500	static int mipi_csis_subdev_host(struct mxc_mipi_csi2_dev *csi2dev)
   501	{
   502		struct device *dev = &csi2dev->pdev->dev;
   503		struct device_node *parent = dev->of_node;
   504		struct device_node *node, *port, *rem;
   505		int ret;
   506	
   507		v4l2_async_notifier_init(&csi2dev->subdev_notifier);
   508	
   509		/* Attach sensors linked to csi receivers */
   510		for_each_available_child_of_node(parent, node) {
   511			if (of_node_cmp(node->name, "port"))
   512				continue;
   513	
   514			/* The csi node can have only port subnode. */
   515			port = of_get_next_child(node, NULL);
   516			if (!port)
   517				continue;
   518			rem = of_graph_get_remote_port_parent(port);
   519			of_node_put(port);
   520			if (rem == NULL) {
   521				v4l2_info(&csi2dev->v4l2_dev,
   522					  "Remote device at %s not found\n",
   523					  port->full_name);
   524				return -1;
   525			} else
   526				v4l2_info(&csi2dev->v4l2_dev,
   527					  "Remote device at %s XXX found\n",
   528					  port->full_name);
   529	
   530			INIT_LIST_HEAD(&csi2dev->asd.list);
   531			csi2dev->asd.match_type = V4L2_ASYNC_MATCH_FWNODE;
   532			csi2dev->asd.match.fwnode = of_fwnode_handle(rem);
   533			csi2dev->async_subdevs[0] = &csi2dev->asd;
   534	
   535			of_node_put(rem);
   536			break;
   537		}
   538	
 > 539		v4l2_async_notifier_add_subdev(&csi2dev->subdev_notifier,
   540						&csi2dev->asd);
   541	
   542		csi2dev->subdev_notifier.v4l2_dev = &csi2dev->v4l2_dev;
   543		csi2dev->subdev_notifier.ops = &subdev_notifier_ops;
   544	
   545		ret = v4l2_async_notifier_register(&csi2dev->v4l2_dev,
   546						   &csi2dev->subdev_notifier);
   547		if (ret)
   548			dev_err(dev,
   549				"Error register async notifier regoster, ret %d\n",
   550				ret);
   551	
   552		return ret;
   553	}
   554	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
