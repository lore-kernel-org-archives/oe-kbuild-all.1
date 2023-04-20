Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF2FC946F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Apr 2023 23:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682033219; x=1713569219;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yl+0IaFjl/+ppqW3nSQRvniTvNRJjZvCRzK842l5/nU=;
  b=k9keH/WM3o+mwia26Emv3Hkes/ZtaTTiDSw4kR3N0HMvfDBO5D3U8z4/
   bXRT01H9VhsycCuhFUgt1XAT7G5i/HJB2xgCoWWZ6UmyxIFbutYY1kFAh
   plNCSjFX1tlQG03/wuI3yzNkkQnEgp/CBF+ridymaa+7IVqk9AMbYz28K
   1eGvpBTrW0Bfnj42jisgqoO/1ILYAKh6UR0aYepNUVLFmrxHv5NDOsfE3
   7N+j+3dwzp7h0I3Ky3j+9x2nACiM/pFQpMpjKA/6fL9rvsziHDHM7if18
   prsnCu5EwDOPKBixd1ULIdEMJTjYFJ5eAWqG4zC6NAz5jUg916A0BVQTG
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="432151312"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; 
   d="scan'208";a="432151312"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2023 16:26:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="938262298"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; 
   d="scan'208";a="938262298"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 20 Apr 2023 16:26:58 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ppdg1-000gAW-0X;
	Thu, 20 Apr 2023 23:26:57 +0000
Date: Fri, 21 Apr 2023 07:26:13 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-1.0.x-imx 4744/9845]
 drivers/media/platform/mxc/capture/ov5647_mipi.c:1522:34: error:
 initialization of 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *,
 struct v4l2_subdev_frame_size_enum *)' from incompatible pointer type 'int
 (*)(struct v4l2_subdev *, struct v4l2_...
Message-ID: <202304210741.QuuO6QbR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.1-1.0.x-imx
head:   897d73a656fe33d0c4549c5de1d07797f99d6871
commit: ce0e2f7e0ebc193aa10e4a6921c61302e470387c [4744/9845] Merge remote-tracking branch 'origin/capture/ov5640' into capture/next
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20230421/202304210741.QuuO6QbR-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Freescale/linux-fslc/commit/ce0e2f7e0ebc193aa10e4a6921c61302e470387c
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc 6.1-1.0.x-imx
        git checkout ce0e2f7e0ebc193aa10e4a6921c61302e470387c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/firmware/imx/ drivers/media/platform/mxc/capture/ drivers/regulator/ drivers/soc/imx/ drivers/staging/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304210741.QuuO6QbR-lkp@intel.com/

All errors (new ones prefixed by >>):

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
>> drivers/media/platform/mxc/capture/ov5647_mipi.c:1522:34: error: initialization of 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_frame_size_enum *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_pad_config *, struct v4l2_subdev_frame_size_enum *)' [-Werror=incompatible-pointer-types]
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
>> drivers/media/platform/mxc/capture/ov5647_mipi.c:1525:34: error: initialization of 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_pad_config *, struct v4l2_subdev_format *)' [-Werror=incompatible-pointer-types]
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
>> drivers/media/platform/mxc/capture/ov5647_mipi.c:1533:27: error: 'ov5647_set_register' undeclared here (not in a function); did you mean 'ov5647_set_shutter'?
    1533 |         .s_register     = ov5647_set_register,
         |                           ^~~~~~~~~~~~~~~~~~~
         |                           ov5647_set_shutter
   cc1: some warnings being treated as errors


vim +1522 drivers/media/platform/mxc/capture/ov5647_mipi.c

c540262b9a9248 Robby Cai 2019-09-27  1520  
c540262b9a9248 Robby Cai 2019-09-27  1521  static const struct v4l2_subdev_pad_ops ov5647_subdev_pad_ops = {
c540262b9a9248 Robby Cai 2019-09-27 @1522  	.enum_frame_size       = ov5647_enum_framesizes,
c540262b9a9248 Robby Cai 2019-09-27  1523  	.enum_frame_interval   = ov5647_enum_frameintervals,
c540262b9a9248 Robby Cai 2019-09-27  1524  	.enum_mbus_code        = ov5647_enum_mbus_code,
c540262b9a9248 Robby Cai 2019-09-27 @1525  	.set_fmt               = ov5647_set_fmt,
c540262b9a9248 Robby Cai 2019-09-27  1526  	.get_fmt               = ov5647_get_fmt,
c540262b9a9248 Robby Cai 2019-09-27  1527  };
c540262b9a9248 Robby Cai 2019-09-27  1528  
c540262b9a9248 Robby Cai 2019-09-27  1529  static struct v4l2_subdev_core_ops ov5647_subdev_core_ops = {
c540262b9a9248 Robby Cai 2019-09-27  1530  	.s_power	= ov5647_s_power,
c540262b9a9248 Robby Cai 2019-09-27  1531  #ifdef CONFIG_VIDEO_ADV_DEBUG
c540262b9a9248 Robby Cai 2019-09-27  1532  	.g_register	= ov5647_get_register,
c540262b9a9248 Robby Cai 2019-09-27 @1533  	.s_register	= ov5647_set_register,
c540262b9a9248 Robby Cai 2019-09-27  1534  #endif
c540262b9a9248 Robby Cai 2019-09-27  1535  };
c540262b9a9248 Robby Cai 2019-09-27  1536  

:::::: The code at line 1522 was first introduced by commit
:::::: c540262b9a924882cfa56687e832a6978c067469 media: capture: add mipi camera ov5647 driver

:::::: TO: Robby Cai <robby.cai@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
