Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF191189511
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Sep 2024 23:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727739647; cv=none; b=TZI59JMi0xCorXyp0/iHqqBPQ5dwcvxvhjuLeNXl97GfBnOKBiCiYeMtoVcli21+U7wzTtx+0c4eEriIgCyYF12q6VYZqA3zAhpLmoaNVkxUbeObFQFCQLaSyUgzT97oZPB9hZbCXQs5Zzl58Ik818aq/CzqCk6CTYeBNXOcuRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727739647; c=relaxed/simple;
	bh=7abqYEX9ikBE5BKrhYHCH3DGCUO/Vgtyi7nDhHV/DZs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lXFzBKz8vfcQGdslBDgO8qIzTZ2fkhzhcoVUebqbk+jrDYG7iUX9aIvwmQqGgjZU1zJmkcVObzQLZvKFNkxlUJwgf8sQAV85qzE7COYjQH5MMCy+3WZ/bI7nmtj1dO3sa93pCROeMIl+pu+eFeD9An3rf4+xu1HzHNmH0Psf5vY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kjXKawX4; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kjXKawX4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727739645; x=1759275645;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7abqYEX9ikBE5BKrhYHCH3DGCUO/Vgtyi7nDhHV/DZs=;
  b=kjXKawX4WjCAp4hYgQUfP77EekAdseDOcMtGFTREVtYMU5vhn2RX0LIX
   MDn+JWhMsKyH6ceO9q9hOOKIHdzZTnMLh/N+qf0fUBuztGipiXK3xQSIb
   vU+KcEdnaRlrbzYBLHVHmngSa2ETK2xztRaWSnzcA1I4wP22XJfHYTpVx
   OywFRjlsH8ElDEg1FSM4A6JL15bIEmZxQegWaImrmWgBM6G+mCC56ycJB
   WptSrnUKQO3VcJU1YwcRh+wXuXYvSOkLczFDFfLwu0Q0U6ETbxsQGRAWL
   74pptDSVnK9SGrIFd9kaKeQunMvytAQjD0G4VynINjgvhaCtB+llwKckU
   w==;
X-CSE-ConnectionGUID: rmwTFIbLTcSTtiJli+Gniw==
X-CSE-MsgGUID: Hnvh6uV3Sdiuy46ZR2R/PA==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="49375288"
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; 
   d="scan'208";a="49375288"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 16:40:44 -0700
X-CSE-ConnectionGUID: kYd95QqZSfCPAEN1ZqjAlw==
X-CSE-MsgGUID: Dey1xy3IQL6UR2d56rlYzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; 
   d="scan'208";a="78320615"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 30 Sep 2024 16:40:43 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svQ0P-000Q2f-07;
	Mon, 30 Sep 2024 23:40:41 +0000
Date: Tue, 1 Oct 2024 07:39:51 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.0.x-imx 5784/16788]
 drivers/media/platform/mxc/capture/ov5647_mipi.c:319:19: error:
 initialization of 'int (*)(struct i2c_client *)' from incompatible pointer
 type 'int (*)(struct i2c_client *, const struct i2c_device_id *)'
Message-ID: <202410010757.j8HWBwjI-lkp@intel.com>
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
commit: a5b79f65b3e476d02b1684409304720f7b0a0ebc [5784/16788] Merge remote-tracking branch 'origin/capture/ov5640' into capture/next
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20241001/202410010757.j8HWBwjI-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241001/202410010757.j8HWBwjI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410010757.j8HWBwjI-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/media/platform/mxc/capture/mx6s_capture.c:365:18: warning: no previous prototype for 'format_by_fourcc' [-Wmissing-prototypes]
     365 | struct mx6s_fmt *format_by_fourcc(int fourcc)
         |                  ^~~~~~~~~~~~~~~~
>> drivers/media/platform/mxc/capture/mx6s_capture.c:378:18: warning: no previous prototype for 'format_by_mbus' [-Wmissing-prototypes]
     378 | struct mx6s_fmt *format_by_mbus(u32 code)
         |                  ^~~~~~~~~~~~~~
>> drivers/media/platform/mxc/capture/mx6s_capture.c:396:6: warning: no previous prototype for 'csi_clk_enable' [-Wmissing-prototypes]
     396 | void csi_clk_enable(struct mx6s_csi_dev *csi_dev)
         |      ^~~~~~~~~~~~~~
>> drivers/media/platform/mxc/capture/mx6s_capture.c:403:6: warning: no previous prototype for 'csi_clk_disable' [-Wmissing-prototypes]
     403 | void csi_clk_disable(struct mx6s_csi_dev *csi_dev)
         |      ^~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/mx6s_capture.c: In function 'mx6sx_register_subdevs':
>> drivers/media/platform/mxc/capture/mx6s_capture.c:1792:39: warning: variable 'asd' set but not used [-Wunused-but-set-variable]
    1792 |         struct v4l2_async_connection *asd;
         |                                       ^~~
--
   drivers/media/platform/mxc/capture/ov5640_v2.c: In function 'ov5640_get_register':
>> drivers/media/platform/mxc/capture/ov5640_v2.c:791:28: warning: unused variable 'client' [-Wunused-variable]
     791 |         struct i2c_client *client = v4l2_get_subdevdata(sd);
         |                            ^~~~~~
   drivers/media/platform/mxc/capture/ov5640_v2.c: In function 'ov5640_set_register':
   drivers/media/platform/mxc/capture/ov5640_v2.c:810:28: warning: unused variable 'client' [-Wunused-variable]
     810 |         struct i2c_client *client = v4l2_get_subdevdata(sd);
         |                            ^~~~~~
   drivers/media/platform/mxc/capture/ov5640_v2.c: In function 'init_device':
>> drivers/media/platform/mxc/capture/ov5640_v2.c:1708:32: warning: variable 'frame_rate' set but not used [-Wunused-but-set-variable]
    1708 |         enum ov5640_frame_rate frame_rate;
         |                                ^~~~~~~~~~
>> drivers/media/platform/mxc/capture/ov5640_v2.c:1706:13: warning: variable 'tgt_xclk' set but not used [-Wunused-but-set-variable]
    1706 |         u32 tgt_xclk;   /* target xclk */
         |             ^~~~~~~~
--
>> drivers/media/platform/mxc/capture/ov5647_mipi.c:319:19: error: initialization of 'int (*)(struct i2c_client *)' from incompatible pointer type 'int (*)(struct i2c_client *, const struct i2c_device_id *)' [-Wincompatible-pointer-types]
     319 |         .probe  = ov5647_probe,
         |                   ^~~~~~~~~~~~
   drivers/media/platform/mxc/capture/ov5647_mipi.c:319:19: note: (near initialization for 'ov5647_i2c_driver.probe')
>> drivers/media/platform/mxc/capture/ov5647_mipi.c:320:19: error: initialization of 'void (*)(struct i2c_client *)' from incompatible pointer type 'int (*)(struct i2c_client *)' [-Wincompatible-pointer-types]
     320 |         .remove = ov5647_remove,
         |                   ^~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/ov5647_mipi.c:320:19: note: (near initialization for 'ov5647_i2c_driver.remove')
   drivers/media/platform/mxc/capture/ov5647_mipi.c: In function 'ov5647_enum_frameintervals':
>> drivers/media/platform/mxc/capture/ov5647_mipi.c:1442:17: error: implicit declaration of function 'pr_warning'; did you mean 'acpi_warning'? [-Wimplicit-function-declaration]
    1442 |                 pr_warning("Please assign pixel format, width and height.\n");
         |                 ^~~~~~~~~~
         |                 acpi_warning
   drivers/media/platform/mxc/capture/ov5647_mipi.c: At top level:
>> drivers/media/platform/mxc/capture/ov5647_mipi.c:1522:34: error: initialization of 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_frame_size_enum *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_pad_config *, struct v4l2_subdev_frame_size_enum *)' [-Wincompatible-pointer-types]
    1522 |         .enum_frame_size       = ov5647_enum_framesizes,
         |                                  ^~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/ov5647_mipi.c:1522:34: note: (near initialization for 'ov5647_subdev_pad_ops.enum_frame_size')
>> drivers/media/platform/mxc/capture/ov5647_mipi.c:1523:34: error: initialization of 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_frame_interval_enum *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_pad_config *, struct v4l2_subdev_frame_interval_enum *)' [-Wincompatible-pointer-types]
    1523 |         .enum_frame_interval   = ov5647_enum_frameintervals,
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/ov5647_mipi.c:1523:34: note: (near initialization for 'ov5647_subdev_pad_ops.enum_frame_interval')
>> drivers/media/platform/mxc/capture/ov5647_mipi.c:1524:34: error: initialization of 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_mbus_code_enum *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_pad_config *, struct v4l2_subdev_mbus_code_enum *)' [-Wincompatible-pointer-types]
    1524 |         .enum_mbus_code        = ov5647_enum_mbus_code,
         |                                  ^~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/ov5647_mipi.c:1524:34: note: (near initialization for 'ov5647_subdev_pad_ops.enum_mbus_code')
>> drivers/media/platform/mxc/capture/ov5647_mipi.c:1525:34: error: initialization of 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_pad_config *, struct v4l2_subdev_format *)' [-Wincompatible-pointer-types]
    1525 |         .set_fmt               = ov5647_set_fmt,
         |                                  ^~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/ov5647_mipi.c:1525:34: note: (near initialization for 'ov5647_subdev_pad_ops.set_fmt')
   drivers/media/platform/mxc/capture/ov5647_mipi.c:1526:34: error: initialization of 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_pad_config *, struct v4l2_subdev_format *)' [-Wincompatible-pointer-types]
    1526 |         .get_fmt               = ov5647_get_fmt,
         |                                  ^~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/ov5647_mipi.c:1526:34: note: (near initialization for 'ov5647_subdev_pad_ops.get_fmt')
>> drivers/media/platform/mxc/capture/ov5647_mipi.c:1532:27: error: 'ov5647_get_register' undeclared here (not in a function); did you mean 'ov5647_get_shutter'?
    1532 |         .g_register     = ov5647_get_register,
         |                           ^~~~~~~~~~~~~~~~~~~
         |                           ov5647_get_shutter
>> drivers/media/platform/mxc/capture/ov5647_mipi.c:1533:27: error: 'ov5647_set_register' undeclared here (not in a function); did you mean 'ov5647_set_shutter'?
    1533 |         .s_register     = ov5647_set_register,
         |                           ^~~~~~~~~~~~~~~~~~~
         |                           ov5647_set_shutter


vim +319 drivers/media/platform/mxc/capture/ov5647_mipi.c

1fbc9a5cc7bd37 Robby Cai 2019-09-27  313  
1fbc9a5cc7bd37 Robby Cai 2019-09-27  314  static struct i2c_driver ov5647_i2c_driver = {
1fbc9a5cc7bd37 Robby Cai 2019-09-27  315  	.driver = {
1fbc9a5cc7bd37 Robby Cai 2019-09-27  316  		  .owner = THIS_MODULE,
1fbc9a5cc7bd37 Robby Cai 2019-09-27  317  		  .name  = "ov5647_mipi",
1fbc9a5cc7bd37 Robby Cai 2019-09-27  318  		  },
1fbc9a5cc7bd37 Robby Cai 2019-09-27 @319  	.probe  = ov5647_probe,
1fbc9a5cc7bd37 Robby Cai 2019-09-27 @320  	.remove = ov5647_remove,
1fbc9a5cc7bd37 Robby Cai 2019-09-27  321  	.id_table = ov5647_id,
1fbc9a5cc7bd37 Robby Cai 2019-09-27  322  };
1fbc9a5cc7bd37 Robby Cai 2019-09-27  323  

:::::: The code at line 319 was first introduced by commit
:::::: 1fbc9a5cc7bd373cf32dc3f66bbadfc57000e43f media: capture: add mipi camera ov5647 driver

:::::: TO: Robby Cai <robby.cai@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
