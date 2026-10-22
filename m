Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792688196;
	b=gmeENd4JXf/H+FhXsqRl+5paG4JMZlrPohLVeFd90ATbx7jPLga94/V6EePAmOwLGpeG
	 kGrS9Dl1T0iv/SbCIn5cyYAn8xwvTDaSlISc2iHXoyv0K1QaGXHEKX/RYJFdopFgul+0j
	 YReErdkA5Iz0d77cokVh0RN2FGqi85kUHbp8Cil6cDjhP6EKBKgxRWTEulkEINnf8bf/j
	 tSZg9e/UuZKaoqxqYVxYFUcgn9PDSmqR6DWD6TDvd3UkCIGVJbjRVP4u8e7wJtjHTOqvN
	 8d3c+rwBjU0dhOEFeL8dIv6tt6OVCO7V9EqDio6CbbPeyM1cN+GWltJ2qG012nD6Fsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792688196;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=IQCPNrM+bZND5J85UFj8CC3XbG2GQeBIWs7ailPMPSE=;
	b=Kkkm1TFSSelxdK9+/3V5XJopLmIojAPL9YGgj9EaOHU5JrNi6XwC2fCsh2o/L6JPk94/
	 nqpW73gy1PwCs61LqFQFrfD51+YS0xN7iDR3FjBVBal0arPpWJ4rD9DWO2c/aKikNbBrS
	 s8OX0MH7cVMeNdgu16pg86P+T1+B5zC2oLWgtZ52uEeNTtrjQBoYA2o30vtmte4/KoDl8
	 T61C+7O2vPuXbLusUkuESH8zMqf9dpw+hFpAaRp9QY6n7AN/8poRi/UBuVAtgSVwwBoda
	 oo3t9+Car4S/4RtPis3n+nC8Nu4vrKffZV6WFLsNmfpCOrqRTx5fRIayDUd6fTjkwZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=J1sXHKV6;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC57B606A31D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Oct 2026 16:56:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC57B606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=J1sXHKV6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792688195; x=1824224195;
  h=date:from:to:cc:subject:message-id;
  bh=zNTyiJlR+xyZMQqtgUuMwZfum3VKhy7A0U7BEGcAapQ=;
  b=J1sXHKV6+lqB1WPwQytV1QIJmjDwrfM82GbLIgq2AFa/dxMxqLiw2pvU
   EY1G8Y4rkkN7C7NLENgHambg87mP+3kG67SZEHQViw9go1mo475gG7a2I
   aOsTJJsWFhZObl74raslujHcVW69wH2194HCBvAOKbeNMHhFS9wuLYfSZ
   T46LpiLliLpJcdn+6eT5pg6QAhBLVSHx7OaeXeR70VMiUfHXLx9AkBWmD
   0sH8Eq0Gf3uNTZA4Eakxb7Z6e8axOGbjCdsdUjX8HKi67m/xgAFpNzOIc
   8V+0CRrkrecLYuvEeyjynHfy8vxetvFVi3PmquAS/SBPzWzsbl1Fh40xY
   g==;
X-CSE-ConnectionGUID: eT70WZMETXWujBwscss+Vw==
X-CSE-MsgGUID: XKtvdhxGRWeqM3qtlnHvuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1457577"
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="1457577"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2026 09:56:34 -0700
X-CSE-ConnectionGUID: zXVGviPiRZOEdmqSSCg9Jg==
X-CSE-MsgGUID: ajAsrVGFRfeLN2l/JuRpCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="3753528"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 22 Oct 2026 09:56:32 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xJw5e-00000000RNu-1XeV;
	Thu, 22 Oct 2026 16:56:30 +0000
Date: Fri, 23 Oct 2026 00:55:39 +0800
From: kernel test robot <lkp@intel.com>
To: syafiqnizam25 <muhammadsyafiqnizamuddinx.binshafie@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "sys_oak" <sys_oak@intel.com>
Subject: [intel-lts:6.18/linux 52/52]
 drivers/media/i2c/d4xx.c:4748:66: warning: '
Message-ID: <202610230037.KDsJDmWX-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi syafiqnizam25,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git 6.18/linux
head:   6f60c9f6344f04a699abb69dd35bc294f6c306d8
commit: 38131e1f862524e81f78a96ae9daf7d22519ef25 [52/52] media: i2c: add d4xx
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20261023/202610230037.KDsJDmWX-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261023/202610230037.KDsJDmWX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610230037.KDsJDmWX-lkp@intel.com/

All warnings (new ones prefixed by >>):

    2718 |         struct ds5 *ds5 = container_of(subdev, struct ds5, mux.sd.subdev);
         |                     ^~~
   drivers/media/i2c/d4xx.c: In function 'ds5_get_fw_info':
   drivers/media/i2c/d4xx.c:3626:13: warning: unused variable 'retry' [-Wunused-variable]
    3626 |         int retry = 5;
         |             ^~~~~
   drivers/media/i2c/d4xx.c:3625:13: warning: unused variable 'ret' [-Wunused-variable]
    3625 |         int ret;
         |             ^~~
   drivers/media/i2c/d4xx.c: At top level:
   drivers/media/i2c/d4xx.c:4058:17: warning: initialized field overwritten [-Woverride-init]
    4058 |         .step = 1,
         |                 ^
   drivers/media/i2c/d4xx.c:4058:17: note: (near initialization for 'ds5_ctrl_erb.step')
   drivers/media/i2c/d4xx.c:4072:17: warning: initialized field overwritten [-Woverride-init]
    4072 |         .step = 1,
         |                 ^
   drivers/media/i2c/d4xx.c:4072:17: note: (near initialization for 'ds5_ctrl_ewb.step')
   drivers/media/i2c/d4xx.c:4086:17: warning: initialized field overwritten [-Woverride-init]
    4086 |         .step = 1,
         |                 ^
   drivers/media/i2c/d4xx.c:4086:17: note: (near initialization for 'ds5_ctrl_hwmc.step')
   drivers/media/i2c/d4xx.c: In function 'ds5_mux_init':
   drivers/media/i2c/d4xx.c:4459:14: warning: unused variable 'suffix' [-Wunused-variable]
    4459 |         char suffix[5];
         |              ^~~~~~
   drivers/media/i2c/d4xx.c: In function 'ds5_dfu_device_release':
   drivers/media/i2c/d4xx.c:4877:22: warning: unused variable 'retry' [-Wunused-variable]
    4877 |         int ret = 0, retry = 10;
         |                      ^~~~~
   drivers/media/i2c/d4xx.c: In function 'ds5_chrdev_init':
   drivers/media/i2c/d4xx.c:4917:14: warning: unused variable 'suffix' [-Wunused-variable]
    4917 |         char suffix[5];
         |              ^~~~~~
   drivers/media/i2c/d4xx.c: In function 'ds5_probe':
   drivers/media/i2c/d4xx.c:5256:40: warning: too many arguments for format [-Wformat-extra-args]
    5256 |                 dev_info(&client->dev, "D4XX recovery state\n", __func__);
         |                                        ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:160:58: note: in expansion of macro 'dev_fmt'
     160 |         dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                          ^~~~~~~
   drivers/media/i2c/d4xx.c:5256:17: note: in expansion of macro 'dev_info'
    5256 |                 dev_info(&client->dev, "D4XX recovery state\n", __func__);
         |                 ^~~~~~~~
   drivers/media/i2c/d4xx.c:5287:13: warning: unused variable 'err' [-Wunused-variable]
    5287 |         int err = sysfs_create_group(&ds5->client->dev.kobj, &ds5_attr_group);
         |             ^~~
   drivers/media/i2c/d4xx.c:5192:36: warning: unused variable 'reg_list' [-Wunused-variable]
    5192 |         const struct ds5_reg_list *reg_list;
         |                                    ^~~~~~~~
   drivers/media/i2c/d4xx.c:5190:29: warning: unused variable 'sd' [-Wunused-variable]
    5190 |         struct v4l2_subdev *sd;
         |                             ^~
   drivers/media/i2c/d4xx.c: At top level:
   drivers/media/i2c/d4xx.c:5150:13: warning: 'ds5_update_pad_format' defined but not used [-Wunused-function]
    5150 | static void ds5_update_pad_format(const struct ds5_resolution *resolutions,
         |             ^~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/d4xx.c:2352:12: warning: 'ds5_mux_set_frame_interval' defined but not used [-Wunused-function]
    2352 | static int ds5_mux_set_frame_interval(struct v4l2_subdev *sd,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/d4xx.c:2325:12: warning: 'ds5_mux_get_frame_interval' defined but not used [-Wunused-function]
    2325 | static int ds5_mux_get_frame_interval(struct v4l2_subdev *sd,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/d4xx.c:2157:21: warning: 'ds5_mbus_code_to_mipi' defined but not used [-Wunused-function]
    2157 | static unsigned int ds5_mbus_code_to_mipi(u32 code)
         |                     ^~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/d4xx.c:1915:12: warning: 'ds5_mux_enum_frame_interval' defined but not used [-Wunused-function]
    1915 | static int ds5_mux_enum_frame_interval(struct v4l2_subdev *sd,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/d4xx.c:1855:12: warning: 'ds5_mux_enum_frame_size' defined but not used [-Wunused-function]
    1855 | static int ds5_mux_enum_frame_size(struct v4l2_subdev *sd,
         |            ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/d4xx.c:1564:12: warning: 'ds5_mux_set_stream' defined but not used [-Wunused-function]
    1564 | static int ds5_mux_set_stream(struct v4l2_subdev *sd, int on)
         |            ^~~~~~~~~~~~~~~~~~
   drivers/media/i2c/d4xx.c:668:36: warning: 'ds5_size_w10' defined but not used [-Wunused-const-variable=]
     668 | static const struct ds5_resolution ds5_size_w10 = {
         |                                    ^~~~~~~~~~~~
   drivers/media/i2c/d4xx.c:497:34: warning: 'ds5_1280_720_30fps_reg_list' defined but not used [-Wunused-const-variable=]
     497 | static const struct ds5_reg_list ds5_1280_720_30fps_reg_list = {
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/d4xx.c:492:34: warning: 'ds5_1920_1080_30fps_reg_list' defined but not used [-Wunused-const-variable=]
     492 | static const struct ds5_reg_list ds5_1920_1080_30fps_reg_list = {
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/d4xx.c:487:34: warning: 'ds5_1920_1536_30fps_reg_list' defined but not used [-Wunused-const-variable=]
     487 | static const struct ds5_reg_list ds5_1920_1536_30fps_reg_list = {
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/d4xx.c:482:34: warning: 'ds5_framesync_reg_list' defined but not used [-Wunused-const-variable=]
     482 | static const struct ds5_reg_list ds5_framesync_reg_list = {
         |                                  ^~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/d4xx.c:477:34: warning: 'ds5_init_reg_list' defined but not used [-Wunused-const-variable=]
     477 | static const struct ds5_reg_list ds5_init_reg_list = {
         |                                  ^~~~~~~~~~~~~~~~~
   drivers/media/i2c/d4xx.c:448:18: warning: 'ds5_framerate_25' defined but not used [-Wunused-const-variable=]
     448 | static const u16 ds5_framerate_25 = 25;
         |                  ^~~~~~~~~~~~~~~~
   drivers/media/i2c/d4xx.c: In function 'ds5_dfu_device_read':
>> drivers/media/i2c/d4xx.c:4748:66: warning: '
      ' directive output may be truncated writing 1 byte into a region of size between 0 and 8 [-Wformat-truncation=]
    4748 |         snprintf(msg, sizeof(msg), "DFU info: \tver:  %d.%d.%d.%d\n",
         |                                                                  ^~
   drivers/media/i2c/d4xx.c:4748:9: note: 'snprintf' output between 26 and 34 bytes into a destination of size 32
    4748 |         snprintf(msg, sizeof(msg), "DFU info: \tver:  %d.%d.%d.%d\n",
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    4749 |                         (fw_ver >> 8) & 0xff, fw_ver & 0xff,
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    4750 |                         (fw_build >> 8) & 0xff, fw_build & 0xff);
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +4748 drivers/media/i2c/d4xx.c

9552247d675e3b2 Khai Wen, Ng 2026-01-06  4732  
9552247d675e3b2 Khai Wen, Ng 2026-01-06  4733  /* When a process reads from our device, this gets called. */
9552247d675e3b2 Khai Wen, Ng 2026-01-06  4734  static ssize_t ds5_dfu_device_read(struct file *flip,
9552247d675e3b2 Khai Wen, Ng 2026-01-06  4735  		char __user *buffer, size_t len, loff_t *offset)
9552247d675e3b2 Khai Wen, Ng 2026-01-06  4736  {
9552247d675e3b2 Khai Wen, Ng 2026-01-06  4737  	struct ds5 *state = flip->private_data;
9552247d675e3b2 Khai Wen, Ng 2026-01-06  4738  	u16 fw_ver, fw_build;
9552247d675e3b2 Khai Wen, Ng 2026-01-06  4739  	char msg[32];
9552247d675e3b2 Khai Wen, Ng 2026-01-06  4740  	int ret = 0;
9552247d675e3b2 Khai Wen, Ng 2026-01-06  4741  
9552247d675e3b2 Khai Wen, Ng 2026-01-06  4742  	if (mutex_lock_interruptible(&state->mutex))
9552247d675e3b2 Khai Wen, Ng 2026-01-06  4743  		return -ERESTARTSYS;
9552247d675e3b2 Khai Wen, Ng 2026-01-06  4744  
9552247d675e3b2 Khai Wen, Ng 2026-01-06  4745  	ret |= ds5_get_fw_info(state, &fw_ver, &fw_build);
9552247d675e3b2 Khai Wen, Ng 2026-01-06  4746  	if (ret < 0)
9552247d675e3b2 Khai Wen, Ng 2026-01-06  4747  		goto e_dfu_read_failed;
9552247d675e3b2 Khai Wen, Ng 2026-01-06 @4748  	snprintf(msg, sizeof(msg), "DFU info: \tver:  %d.%d.%d.%d\n",
9552247d675e3b2 Khai Wen, Ng 2026-01-06  4749  			(fw_ver >> 8) & 0xff, fw_ver & 0xff,
9552247d675e3b2 Khai Wen, Ng 2026-01-06  4750  			(fw_build >> 8) & 0xff, fw_build & 0xff);
9552247d675e3b2 Khai Wen, Ng 2026-01-06  4751  
9552247d675e3b2 Khai Wen, Ng 2026-01-06  4752  	if (copy_to_user(buffer, msg, strlen(msg)))
9552247d675e3b2 Khai Wen, Ng 2026-01-06  4753  		ret = -EFAULT;
9552247d675e3b2 Khai Wen, Ng 2026-01-06  4754  	else {
9552247d675e3b2 Khai Wen, Ng 2026-01-06  4755  		state->dfu_dev.msg_write_once = ~state->dfu_dev.msg_write_once;
9552247d675e3b2 Khai Wen, Ng 2026-01-06  4756  		ret = strlen(msg) & state->dfu_dev.msg_write_once;
9552247d675e3b2 Khai Wen, Ng 2026-01-06  4757  	}
9552247d675e3b2 Khai Wen, Ng 2026-01-06  4758  
9552247d675e3b2 Khai Wen, Ng 2026-01-06  4759  e_dfu_read_failed:
9552247d675e3b2 Khai Wen, Ng 2026-01-06  4760  	mutex_unlock(&state->mutex);
9552247d675e3b2 Khai Wen, Ng 2026-01-06  4761  	return ret;
9552247d675e3b2 Khai Wen, Ng 2026-01-06  4762  };
9552247d675e3b2 Khai Wen, Ng 2026-01-06  4763  

:::::: The code at line 4748 was first introduced by commit
:::::: 9552247d675e3b2f6a968db946f6531505b8047c media: i2c: Add D4XX support and D4XX driver

:::::: TO: Khai Wen, Ng <khai.wen.ng@intel.com>
:::::: CC: sys_oak <sys_oak@intel.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
