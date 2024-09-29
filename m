Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D71BC1EA73
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Sep 2024 08:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727598083; cv=none; b=heyhJqOmmB3fYyseWTYuR8ZNzcsmCdQcbe8vmlF4YqyonBU4ySg4iz1jIQqV5eI1HLm/NSJXjV1u33V6rK6Zd9DNcfuw1f7B6Fi9wVGWonBt0BXt+iayenpnUYI6NVoAui13Qgt6y1RC56/zsp3j2sbWahChygNk0HpxcyIoi+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727598083; c=relaxed/simple;
	bh=T+dnRPylTJHv/gGMHbY/8eA2Y3cuFioATyLS2f5M7EE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f9ALPkPLHdoK0cgaW5b+nPSRgmT7myTLWyMubCGLJde7XBiVH8NK0caQD855Mmjh6xia5K+Yf0IEH/tP+/rAGGGFPMJGDGqdpU1/WPRXNPguKbDGAlYz3b3ogB9XgkEM7vXUZku9JWRTixSOuDITkdbvveywJNdAnKVPrzndT6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BJn1yF/8; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BJn1yF/8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727598081; x=1759134081;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T+dnRPylTJHv/gGMHbY/8eA2Y3cuFioATyLS2f5M7EE=;
  b=BJn1yF/8HyV/zPa15dXFVIXP8K9z+Yb5x7/X1sdfOqYdkAE1alQCLQb8
   uNyrIuTpcnh/kbvVz4PxK8WO2FJ6rQs13FhpA6tl/Kplm69ijREEI4/9h
   wcFlf+wYF6hnEUfWuehQ6bxhwrCqEMhDisQxscwoFotyTgHJW0JxBCf6/
   edMo8ajFxV4M8lr4GuwkOkODIlAtjyHfRzMhttOfmcBTGBkpS4t/SeT05
   HxmuXj2EeTZe4Q6LN6aAXrReKMAG8vD6xK4xcZGjqgVbYiwttEZ/+OyLm
   CBPNGf+tmnz3dDgkl/zuTs8+L9aescUsTsGJaUE7H4uNIrzGmPfOIUn/L
   Q==;
X-CSE-ConnectionGUID: qi+5c3FyTzWjhPFc//OsgA==
X-CSE-MsgGUID: C3N/fGHnTS641ZjyNK6nMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11209"; a="37264866"
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; 
   d="scan'208";a="37264866"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2024 01:21:21 -0700
X-CSE-ConnectionGUID: 0Iw6XBTBT8iPhRcX/L3VxQ==
X-CSE-MsgGUID: wn/iYkvhSXarVIV8go5q2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; 
   d="scan'208";a="72956021"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 29 Sep 2024 01:21:19 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1supB7-000O5v-0J;
	Sun, 29 Sep 2024 08:21:17 +0000
Date: Sun, 29 Sep 2024 16:21:15 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.0.x-imx 222/16788]
 drivers/media/platform/imx8/mxc-mipi-csi2_yav.c:412:46: warning:
 'mipi_csi2_sd_internal_ops' defined but not used
Message-ID: <202409291628.Ft9USNP2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-2.0.x-imx
head:   ac32ba5fe66266329914d2020570364afe217bec
commit: f9b4ed2a18575180b975a6702fd45b6a66d877dc [222/16788] media: mipi csi: add mixel's mipi csi driver
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20240929/202409291628.Ft9USNP2-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240929/202409291628.Ft9USNP2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409291628.Ft9USNP2-lkp@intel.com/

All warnings (new ones prefixed by >>):

    1821 |                          v4l2_subdev_call_wrappers.o->f)                \
         |                                                     ^~
   drivers/media/platform/imx8/mxc-mipi-csi2_yav.c:401:16: note: in expansion of macro 'v4l2_subdev_call'
     401 |         return v4l2_subdev_call(sensor_sd, video, s_parm, a);
         |                ^~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:1822:63: error: 'const struct v4l2_subdev_video_ops' has no member named 's_parm'
    1822 |                         __result = v4l2_subdev_call_wrappers.o->f(      \
         |                                                               ^~
   drivers/media/platform/imx8/mxc-mipi-csi2_yav.c:401:16: note: in expansion of macro 'v4l2_subdev_call'
     401 |         return v4l2_subdev_call(sensor_sd, video, s_parm, a);
         |                ^~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:1825:48: error: 'const struct v4l2_subdev_video_ops' has no member named 's_parm'
    1825 |                         __result = __sd->ops->o->f(__sd, ##args);       \
         |                                                ^~
   drivers/media/platform/imx8/mxc-mipi-csi2_yav.c:401:16: note: in expansion of macro 'v4l2_subdev_call'
     401 |         return v4l2_subdev_call(sensor_sd, video, s_parm, a);
         |                ^~~~~~~~~~~~~~~~
   drivers/media/platform/imx8/mxc-mipi-csi2_yav.c: In function 'mipi_csis_g_parm':
   include/media/v4l2-subdev.h:1818:56: error: 'const struct v4l2_subdev_video_ops' has no member named 'g_parm'
    1818 |                 else if (!(__sd->ops->o && __sd->ops->o->f))            \
         |                                                        ^~
   drivers/media/platform/imx8/mxc-mipi-csi2_yav.c:409:16: note: in expansion of macro 'v4l2_subdev_call'
     409 |         return v4l2_subdev_call(sensor_sd, video, g_parm, a);
         |                ^~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:1821:53: error: 'const struct v4l2_subdev_video_ops' has no member named 'g_parm'
    1821 |                          v4l2_subdev_call_wrappers.o->f)                \
         |                                                     ^~
   drivers/media/platform/imx8/mxc-mipi-csi2_yav.c:409:16: note: in expansion of macro 'v4l2_subdev_call'
     409 |         return v4l2_subdev_call(sensor_sd, video, g_parm, a);
         |                ^~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:1822:63: error: 'const struct v4l2_subdev_video_ops' has no member named 'g_parm'
    1822 |                         __result = v4l2_subdev_call_wrappers.o->f(      \
         |                                                               ^~
   drivers/media/platform/imx8/mxc-mipi-csi2_yav.c:409:16: note: in expansion of macro 'v4l2_subdev_call'
     409 |         return v4l2_subdev_call(sensor_sd, video, g_parm, a);
         |                ^~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:1825:48: error: 'const struct v4l2_subdev_video_ops' has no member named 'g_parm'
    1825 |                         __result = __sd->ops->o->f(__sd, ##args);       \
         |                                                ^~
   drivers/media/platform/imx8/mxc-mipi-csi2_yav.c:409:16: note: in expansion of macro 'v4l2_subdev_call'
     409 |         return v4l2_subdev_call(sensor_sd, video, g_parm, a);
         |                ^~~~~~~~~~~~~~~~
   drivers/media/platform/imx8/mxc-mipi-csi2_yav.c: At top level:
   drivers/media/platform/imx8/mxc-mipi-csi2_yav.c:417:28: error: initialization of 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_frame_size_enum *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_pad_config *, struct v4l2_subdev_frame_size_enum *)' [-Wincompatible-pointer-types]
     417 |         .enum_frame_size = mipi_csis_enum_framesizes,
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imx8/mxc-mipi-csi2_yav.c:417:28: note: (near initialization for 'mipi_csi2_pad_ops.enum_frame_size')
   drivers/media/platform/imx8/mxc-mipi-csi2_yav.c:418:32: error: initialization of 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_frame_interval_enum *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_pad_config *, struct v4l2_subdev_frame_interval_enum *)' [-Wincompatible-pointer-types]
     418 |         .enum_frame_interval = mipi_csis_enum_frameintervals,
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imx8/mxc-mipi-csi2_yav.c:418:32: note: (near initialization for 'mipi_csi2_pad_ops.enum_frame_interval')
   drivers/media/platform/imx8/mxc-mipi-csi2_yav.c:419:27: error: initialization of 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_mbus_code_enum *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_pad_config *, struct v4l2_subdev_mbus_code_enum *)' [-Wincompatible-pointer-types]
     419 |         .enum_mbus_code = mipi_csis_enum_mbus_code,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imx8/mxc-mipi-csi2_yav.c:419:27: note: (near initialization for 'mipi_csi2_pad_ops.enum_mbus_code')
   drivers/media/platform/imx8/mxc-mipi-csi2_yav.c:420:20: error: initialization of 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_pad_config *, struct v4l2_subdev_format *)' [-Wincompatible-pointer-types]
     420 |         .get_fmt = mipi_csi2_get_fmt,
         |                    ^~~~~~~~~~~~~~~~~
   drivers/media/platform/imx8/mxc-mipi-csi2_yav.c:420:20: note: (near initialization for 'mipi_csi2_pad_ops.get_fmt')
   drivers/media/platform/imx8/mxc-mipi-csi2_yav.c:421:20: error: initialization of 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_pad_config *, struct v4l2_subdev_format *)' [-Wincompatible-pointer-types]
     421 |         .set_fmt = mipi_csi2_set_fmt,
         |                    ^~~~~~~~~~~~~~~~~
   drivers/media/platform/imx8/mxc-mipi-csi2_yav.c:421:20: note: (near initialization for 'mipi_csi2_pad_ops.set_fmt')
   drivers/media/platform/imx8/mxc-mipi-csi2_yav.c:431:10: error: 'struct v4l2_subdev_video_ops' has no member named 's_parm'
     431 |         .s_parm = mipi_csis_s_parm,
         |          ^~~~~~
   drivers/media/platform/imx8/mxc-mipi-csi2_yav.c:431:19: error: initialization of 'int (*)(struct v4l2_subdev *, struct v4l2_fract *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_streamparm *)' [-Wincompatible-pointer-types]
     431 |         .s_parm = mipi_csis_s_parm,
         |                   ^~~~~~~~~~~~~~~~
   drivers/media/platform/imx8/mxc-mipi-csi2_yav.c:431:19: note: (near initialization for 'mipi_csi2_video_ops.g_pixelaspect')
   drivers/media/platform/imx8/mxc-mipi-csi2_yav.c:432:10: error: 'struct v4l2_subdev_video_ops' has no member named 'g_parm'
     432 |         .g_parm = mipi_csis_g_parm,
         |          ^~~~~~
   drivers/media/platform/imx8/mxc-mipi-csi2_yav.c:432:19: error: initialization of 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_frame_interval *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_streamparm *)' [-Wincompatible-pointer-types]
     432 |         .g_parm = mipi_csis_g_parm,
         |                   ^~~~~~~~~~~~~~~~
   drivers/media/platform/imx8/mxc-mipi-csi2_yav.c:432:19: note: (near initialization for 'mipi_csi2_video_ops.g_frame_interval')
   drivers/media/platform/imx8/mxc-mipi-csi2_yav.c:497:18: error: initialization of 'int (*)(struct v4l2_async_notifier *, struct v4l2_subdev *, struct v4l2_async_connection *)' from incompatible pointer type 'int (*)(struct v4l2_async_notifier *, struct v4l2_subdev *, struct v4l2_async_subdev *)' [-Wincompatible-pointer-types]
     497 |         .bound = subdev_notifier_bound,
         |                  ^~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imx8/mxc-mipi-csi2_yav.c:497:18: note: (near initialization for 'subdev_notifier_ops.bound')
   drivers/media/platform/imx8/mxc-mipi-csi2_yav.c: In function 'mipi_csis_subdev_host':
   drivers/media/platform/imx8/mxc-mipi-csi2_yav.c:507:9: error: implicit declaration of function 'v4l2_async_notifier_init'; did you mean 'v4l2_async_nf_init'? [-Wimplicit-function-declaration]
     507 |         v4l2_async_notifier_init(&csi2dev->subdev_notifier);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
         |         v4l2_async_nf_init
   drivers/media/platform/imx8/mxc-mipi-csi2_yav.c:531:43: error: 'V4L2_ASYNC_MATCH_FWNODE' undeclared (first use in this function); did you mean 'V4L2_ASYNC_MATCH_TYPE_FWNODE'?
     531 |                 csi2dev->asd.match_type = V4L2_ASYNC_MATCH_FWNODE;
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~
         |                                           V4L2_ASYNC_MATCH_TYPE_FWNODE
   drivers/media/platform/imx8/mxc-mipi-csi2_yav.c:531:43: note: each undeclared identifier is reported only once for each function it appears in
   drivers/media/platform/imx8/mxc-mipi-csi2_yav.c:539:9: error: implicit declaration of function 'v4l2_async_notifier_add_subdev'; did you mean 'v4l2_async_register_subdev'? [-Wimplicit-function-declaration]
     539 |         v4l2_async_notifier_add_subdev(&csi2dev->subdev_notifier,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |         v4l2_async_register_subdev
   drivers/media/platform/imx8/mxc-mipi-csi2_yav.c:545:15: error: implicit declaration of function 'v4l2_async_notifier_register'; did you mean 'v4l2_async_nf_register'? [-Wimplicit-function-declaration]
     545 |         ret = v4l2_async_notifier_register(&csi2dev->v4l2_dev,
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |               v4l2_async_nf_register
   drivers/media/platform/imx8/mxc-mipi-csi2_yav.c: At top level:
>> drivers/media/platform/imx8/mxc-mipi-csi2_yav.c:412:46: warning: 'mipi_csi2_sd_internal_ops' defined but not used [-Wunused-const-variable=]
     412 | static const struct v4l2_subdev_internal_ops mipi_csi2_sd_internal_ops = {
         |                                              ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +/mipi_csi2_sd_internal_ops +412 drivers/media/platform/imx8/mxc-mipi-csi2_yav.c

   411	
 > 412	static const struct v4l2_subdev_internal_ops mipi_csi2_sd_internal_ops = {
   413		.open = mipi_csi2_open,
   414	};
   415	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
