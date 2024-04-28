Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734344F894
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Apr 2024 07:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714288463; cv=none; b=OELjxZtWVtXvyUwIgKnWCiMewQtjVsyM8pwjp9gf5ftZXdQNYS8p40GxbTbWnMxH7HXoY4cudfqWud0m7fBnI6VCj+Mab0zI5007DKUHKeE/emwFE4x6vJJcTQK/xmI/FS18jnCUcgFsQCAd+ibU3G/e86+WenFb6ryRjYqOvss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714288463; c=relaxed/simple;
	bh=N7JJM+eyzQu0wu6HLCLMMmaRpnm0inpgQxwc0p1Mvxc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hR0Fwo/LFCTJaAEi9hun4HNtxGCNKJXNpkRc3CmhYDLBs+kllHag0Jwyiu0sFE8XB66mpnQ9tOKXcuMB3pAfA/Swk7AHWAKEO3bCYbiYe44uFIByooYniJJnbc1XkO3vAWmQ/9wYmWD1aT3IWyUyrRRibSsxFdF2U2VWusUS+4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jqpoO9hU; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jqpoO9hU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714288461; x=1745824461;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=N7JJM+eyzQu0wu6HLCLMMmaRpnm0inpgQxwc0p1Mvxc=;
  b=jqpoO9hUu7vjnHTf0UkA9BB5yJqTb6D/cYdOt2fk8RudqIqjC0fcuYNq
   zDgsUeUMl38yCPCKZ+oNfs4nvJA4XJeESGG5D6FB2Nb3HLQtSrAILy/xQ
   +DDuZQ34Jat8ALKq0z3D+U77VPm22v8pC/o1ra09AvtjK0mhbcGVFOksV
   YMqyr2S8IWz3W+MUAz5K3MxAU+mIBJ6D3k2Ps4zTLTwVO7q39tpc+2amh
   Cuup308qhItrDURKvqImCaqEm49vI1Q5gfLeVKeAm2pUMZA4ZPk0lm+0t
   TE7iyIZ1AFy8lUQFNSn2KIo2AC65OJWc7qZ8WcqxLZTMLnhitHq5bk1Pm
   A==;
X-CSE-ConnectionGUID: neiv84IAQEWElqy0IMzzmw==
X-CSE-MsgGUID: VMEStcnvR22nRz7Bim9DVA==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="35364996"
X-IronPort-AV: E=Sophos;i="6.07,237,1708416000"; 
   d="scan'208";a="35364996"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2024 00:14:20 -0700
X-CSE-ConnectionGUID: 8ONFlMpWR2eXGNbsJlgHNA==
X-CSE-MsgGUID: 9eLk8avtRiWwJ0XL69BL9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,237,1708416000"; 
   d="scan'208";a="30466238"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 28 Apr 2024 00:14:19 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s0yjp-0005xS-0S;
	Sun, 28 Apr 2024 07:14:17 +0000
Date: Sun, 28 Apr 2024 15:13:38 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-1.0.x-imx 5784/11728]
 drivers/media/platform/mxc/capture/ov5647_mipi.c:319:19: error:
 initialization of 'int (*)(struct i2c_client *)' from incompatible pointer
 type 'int (*)(struct i2c_client *, const struct i2c_device_id *)'
Message-ID: <202404281516.vNRsRY8i-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-1.0.x-imx
head:   37770f55ac9c4f6cd958eb5544939207eed8478f
commit: a5b79f65b3e476d02b1684409304720f7b0a0ebc [5784/11728] Merge remote-tracking branch 'origin/capture/ov5640' into capture/next
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240428/202404281516.vNRsRY8i-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240428/202404281516.vNRsRY8i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404281516.vNRsRY8i-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/platform/mxc/capture/ov5647_mipi.c:319:19: error: initialization of 'int (*)(struct i2c_client *)' from incompatible pointer type 'int (*)(struct i2c_client *, const struct i2c_device_id *)' [-Werror=incompatible-pointer-types]
     319 |         .probe  = ov5647_probe,
         |                   ^~~~~~~~~~~~
   drivers/media/platform/mxc/capture/ov5647_mipi.c:319:19: note: (near initialization for 'ov5647_i2c_driver.probe')
   drivers/media/platform/mxc/capture/ov5647_mipi.c:320:19: error: initialization of 'void (*)(struct i2c_client *)' from incompatible pointer type 'int (*)(struct i2c_client *)' [-Werror=incompatible-pointer-types]
     320 |         .remove = ov5647_remove,
         |                   ^~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/ov5647_mipi.c:320:19: note: (near initialization for 'ov5647_i2c_driver.remove')
   drivers/media/platform/mxc/capture/ov5647_mipi.c: In function 'ov5647_enum_frameintervals':
   drivers/media/platform/mxc/capture/ov5647_mipi.c:1442:17: error: implicit declaration of function 'pr_warning'; did you mean 'acpi_warning'? [-Werror=implicit-function-declaration]
    1442 |                 pr_warning("Please assign pixel format, width and height.\n");
         |                 ^~~~~~~~~~
         |                 acpi_warning
   drivers/media/platform/mxc/capture/ov5647_mipi.c: At top level:
   drivers/media/platform/mxc/capture/ov5647_mipi.c:1522:34: error: initialization of 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_frame_size_enum *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_pad_config *, struct v4l2_subdev_frame_size_enum *)' [-Werror=incompatible-pointer-types]
    1522 |         .enum_frame_size       = ov5647_enum_framesizes,
         |                                  ^~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/ov5647_mipi.c:1522:34: note: (near initialization for 'ov5647_subdev_pad_ops.enum_frame_size')
   drivers/media/platform/mxc/capture/ov5647_mipi.c:1523:34: error: initialization of 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_frame_interval_enum *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_pad_config *, struct v4l2_subdev_frame_interval_enum *)' [-Werror=incompatible-pointer-types]
    1523 |         .enum_frame_interval   = ov5647_enum_frameintervals,
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/ov5647_mipi.c:1523:34: note: (near initialization for 'ov5647_subdev_pad_ops.enum_frame_interval')
   drivers/media/platform/mxc/capture/ov5647_mipi.c:1524:34: error: initialization of 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_mbus_code_enum *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_pad_config *, struct v4l2_subdev_mbus_code_enum *)' [-Werror=incompatible-pointer-types]
    1524 |         .enum_mbus_code        = ov5647_enum_mbus_code,
         |                                  ^~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/ov5647_mipi.c:1524:34: note: (near initialization for 'ov5647_subdev_pad_ops.enum_mbus_code')
   drivers/media/platform/mxc/capture/ov5647_mipi.c:1525:34: error: initialization of 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_pad_config *, struct v4l2_subdev_format *)' [-Werror=incompatible-pointer-types]
    1525 |         .set_fmt               = ov5647_set_fmt,
         |                                  ^~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/ov5647_mipi.c:1525:34: note: (near initialization for 'ov5647_subdev_pad_ops.set_fmt')
   drivers/media/platform/mxc/capture/ov5647_mipi.c:1526:34: error: initialization of 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_pad_config *, struct v4l2_subdev_format *)' [-Werror=incompatible-pointer-types]
    1526 |         .get_fmt               = ov5647_get_fmt,
         |                                  ^~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/ov5647_mipi.c:1526:34: note: (near initialization for 'ov5647_subdev_pad_ops.get_fmt')
   drivers/media/platform/mxc/capture/ov5647_mipi.c:1532:27: error: 'ov5647_get_register' undeclared here (not in a function); did you mean 'ov5647_get_shutter'?
    1532 |         .g_register     = ov5647_get_register,
         |                           ^~~~~~~~~~~~~~~~~~~
         |                           ov5647_get_shutter
   drivers/media/platform/mxc/capture/ov5647_mipi.c:1533:27: error: 'ov5647_set_register' undeclared here (not in a function); did you mean 'ov5647_set_shutter'?
    1533 |         .s_register     = ov5647_set_register,
         |                           ^~~~~~~~~~~~~~~~~~~
         |                           ov5647_set_shutter
   cc1: some warnings being treated as errors


vim +319 drivers/media/platform/mxc/capture/ov5647_mipi.c

1fbc9a5cc7bd37 Robby Cai 2019-09-27  313  
1fbc9a5cc7bd37 Robby Cai 2019-09-27  314  static struct i2c_driver ov5647_i2c_driver = {
1fbc9a5cc7bd37 Robby Cai 2019-09-27  315  	.driver = {
1fbc9a5cc7bd37 Robby Cai 2019-09-27  316  		  .owner = THIS_MODULE,
1fbc9a5cc7bd37 Robby Cai 2019-09-27  317  		  .name  = "ov5647_mipi",
1fbc9a5cc7bd37 Robby Cai 2019-09-27  318  		  },
1fbc9a5cc7bd37 Robby Cai 2019-09-27 @319  	.probe  = ov5647_probe,
1fbc9a5cc7bd37 Robby Cai 2019-09-27  320  	.remove = ov5647_remove,
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
