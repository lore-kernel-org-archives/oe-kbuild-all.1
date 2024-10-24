Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A63B43C3C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Oct 2024 03:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729739195; cv=none; b=jeSFnbAJ93qK3n7ml6jB5x6o5OaraAP+GnGVqeBEPhdbTKZ5qz1WyLucwB7Jy74lXZ9lS8Pvab+bf+sYydT6Ep84xU462D0BHgXNpNkuggGfwxYD/IQI5xELfGHBp83s3esiZyxeTg+I8XSA4YVE2cGBfBlxe15JR5x7jswDPaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729739195; c=relaxed/simple;
	bh=GMyTj6YtF4CASybBGOc9EwrI/fNnv2B8IImVcjZlpVY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uNlCzl1qZtU6fnNCNaRrzTU4fwHFC8XC2WkkdLJgcQ024nbgs9sfK/VzsKYDoY+979OJed0NPmlTRBetVUWvR2YCJoY54rdSbIdW1LRV+ZX5HrXwHoVJBmvn3UIJmz6sP4CE6ZqtiW5h8zXDCBR/8UGnWMn5ildxxnLS6C1hE1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UM7JVqNy; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UM7JVqNy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729739193; x=1761275193;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GMyTj6YtF4CASybBGOc9EwrI/fNnv2B8IImVcjZlpVY=;
  b=UM7JVqNyUJ4EW88prbJeiNAsgH1tsrTYeMO6sNtlw2AoSB4VlGlkz7Js
   4wTUyz/a3AsRZgRP3/imSfDj6qrF75ZU+esfVyUqE+VnPb9npveLBw9GH
   PfsqVAm4VCYAUEqD/ex6tcPAenvpy6/w7pcWIQpMxu7FqWdc9FZLQ9uRi
   bonhyGjevzpTVumjy5Wpd85Mi7aGPSAMW7jgqlxBnmLQfyPNIgpgedcnE
   +uwaJwgWq1UesKfKPlreWtFUZP+AqVqwaTipRuasMCHAo+wcZqq+RuC13
   3z5zDjeiAy78L+1cDeDVS5KP/+8pj2KcRBkK7t0uq8pwTTmwQ5UC3ywFS
   w==;
X-CSE-ConnectionGUID: CyYv9YYmSTmzbMtE9qTbPQ==
X-CSE-MsgGUID: ft3Oer6UQrCt6SVLlkhNag==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29477047"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29477047"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2024 20:06:33 -0700
X-CSE-ConnectionGUID: savL2fB1REmdctFouIa9IQ==
X-CSE-MsgGUID: LJycVQlRQUeWSK2Pcj9Zeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,228,1725346800"; 
   d="scan'208";a="80461880"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 23 Oct 2024 20:06:32 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3oBA-000Vrm-3B;
	Thu, 24 Oct 2024 03:06:28 +0000
Date: Thu, 24 Oct 2024 11:05:43 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.1.x-imx 222/17820]
 drivers/media/platform/imx8/mxc-mipi-csi2_yav.c:412:46: warning:
 'mipi_csi2_sd_internal_ops' defined but not used
Message-ID: <202410241111.dSQKhF9N-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Robby,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc 6.6-2.1.x-imx
head:   47d927c130da97d140d1455103e3cacecef94807
commit: f9b4ed2a18575180b975a6702fd45b6a66d877dc [222/17820] media: mipi csi: add mixel's mipi csi driver
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20241024/202410241111.dSQKhF9N-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241024/202410241111.dSQKhF9N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410241111.dSQKhF9N-lkp@intel.com/

All warnings (new ones prefixed by >>):

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
   drivers/media/platform/imx8/mxc-mipi-csi2_yav.c:431:19: error: initialization of 'int (*)(struct v4l2_subdev *, void *, unsigned int *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_streamparm *)' [-Werror=incompatible-pointer-types]
   drivers/media/platform/imx8/mxc-mipi-csi2_yav.c:431:19: note: (near initialization for 'mipi_csi2_video_ops.s_rx_buffer')
   drivers/media/platform/imx8/mxc-mipi-csi2_yav.c:432:10: error: 'struct v4l2_subdev_video_ops' has no member named 'g_parm'
     432 |         .g_parm = mipi_csis_g_parm,
         |          ^~~~~~
   drivers/media/platform/imx8/mxc-mipi-csi2_yav.c:432:19: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
     432 |         .g_parm = mipi_csis_g_parm,
         |                   ^~~~~~~~~~~~~~~~
   drivers/media/platform/imx8/mxc-mipi-csi2_yav.c:432:19: note: (near initialization for 'mipi_csi2_video_ops')
   drivers/media/platform/imx8/mxc-mipi-csi2_yav.c:432:19: error: initialization of 'int (*)(struct v4l2_subdev *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_streamparm *)' [-Werror=incompatible-pointer-types]
   drivers/media/platform/imx8/mxc-mipi-csi2_yav.c:432:19: note: (near initialization for 'mipi_csi2_video_ops.post_streamoff')
   drivers/media/platform/imx8/mxc-mipi-csi2_yav.c:497:18: error: initialization of 'int (*)(struct v4l2_async_notifier *, struct v4l2_subdev *, struct v4l2_async_connection *)' from incompatible pointer type 'int (*)(struct v4l2_async_notifier *, struct v4l2_subdev *, struct v4l2_async_subdev *)' [-Werror=incompatible-pointer-types]
     497 |         .bound = subdev_notifier_bound,
         |                  ^~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imx8/mxc-mipi-csi2_yav.c:497:18: note: (near initialization for 'subdev_notifier_ops.bound')
   drivers/media/platform/imx8/mxc-mipi-csi2_yav.c: In function 'mipi_csis_subdev_host':
   drivers/media/platform/imx8/mxc-mipi-csi2_yav.c:507:9: error: implicit declaration of function 'v4l2_async_notifier_init'; did you mean 'v4l2_async_nf_init'? [-Werror=implicit-function-declaration]
     507 |         v4l2_async_notifier_init(&csi2dev->subdev_notifier);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
         |         v4l2_async_nf_init
   drivers/media/platform/imx8/mxc-mipi-csi2_yav.c:531:43: error: 'V4L2_ASYNC_MATCH_FWNODE' undeclared (first use in this function); did you mean 'V4L2_ASYNC_MATCH_TYPE_FWNODE'?
     531 |                 csi2dev->asd.match_type = V4L2_ASYNC_MATCH_FWNODE;
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~
         |                                           V4L2_ASYNC_MATCH_TYPE_FWNODE
   drivers/media/platform/imx8/mxc-mipi-csi2_yav.c:531:43: note: each undeclared identifier is reported only once for each function it appears in
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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
