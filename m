Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62EC53212
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Apr 2023 18:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682016653; x=1713552653;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=54LCJMjKk33330w618Zo/P/FJU5i0UXP+2jFpgG4O3o=;
  b=g3tjn/y+qoX/o5iv/VOdNf96j7f322MWqcUvqFRZ4g315r7rpd4BQ9w6
   DVMLOpvgS0FccgNB7NkVWbivAr3mRlo9e9sYgr5KSIZSExxlmHMNHu/Zq
   +w9Dq0zzmXZd7Aok7nJb1oFl8CGdOIzI5/h0cMaI/Sh9QOmgoeUb4ge+t
   bHZleZT1vcjCrYNmRRX5b3Dwzml1GwbBXB6ZHP9vnr18/lod56Fl0j5RM
   vgX6hQqUZFvZpShBydUMoqyvlDEtW4JcJ9CAljOxxrsKIJBdsGbjneHZ6
   sFnXdXwxWkI+494wtuOw5lqxT8VOmkS/ukbqyLyokeJy98Uy3df6qxRlw
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="347717400"
X-IronPort-AV: E=Sophos;i="5.99,213,1677571200"; 
   d="scan'208";a="347717400"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2023 11:50:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="724522132"
X-IronPort-AV: E=Sophos;i="5.99,213,1677571200"; 
   d="scan'208";a="724522132"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 20 Apr 2023 11:50:51 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ppZMo-000g1S-3B;
	Thu, 20 Apr 2023 18:50:50 +0000
Date: Fri, 21 Apr 2023 02:49:52 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-1.0.x-imx 4744/9845]
 drivers/media/platform/mxc/capture/ov5647_mipi.c:320:19: error:
 initialization of 'void (*)(struct i2c_client *)' from incompatible pointer
 type 'int (*)(struct i2c_client *)'
Message-ID: <202304210218.hSdlRePi-lkp@intel.com>
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
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20230421/202304210218.hSdlRePi-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Freescale/linux-fslc/commit/ce0e2f7e0ebc193aa10e4a6921c61302e470387c
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc 6.1-1.0.x-imx
        git checkout ce0e2f7e0ebc193aa10e4a6921c61302e470387c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304210218.hSdlRePi-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/platform/mxc/capture/ov5647_mipi.c:320:19: error: initialization of 'void (*)(struct i2c_client *)' from incompatible pointer type 'int (*)(struct i2c_client *)' [-Werror=incompatible-pointer-types]
     320 |         .remove = ov5647_remove,
         |                   ^~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/ov5647_mipi.c:320:19: note: (near initialization for 'ov5647_i2c_driver.remove')
   drivers/media/platform/mxc/capture/ov5647_mipi.c: In function 'ov5647_enum_frameintervals':
>> drivers/media/platform/mxc/capture/ov5647_mipi.c:1442:17: error: implicit declaration of function 'pr_warning'; did you mean 'acpi_warning'? [-Werror=implicit-function-declaration]
    1442 |                 pr_warning("Please assign pixel format, width and height.\n");
         |                 ^~~~~~~~~~
         |                 acpi_warning
   drivers/media/platform/mxc/capture/ov5647_mipi.c: At top level:
   drivers/media/platform/mxc/capture/ov5647_mipi.c:1522:34: error: initialization of 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_frame_size_enum *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_pad_config *, struct v4l2_subdev_frame_size_enum *)' [-Werror=incompatible-pointer-types]
    1522 |         .enum_frame_size       = ov5647_enum_framesizes,
         |                                  ^~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/ov5647_mipi.c:1522:34: note: (near initialization for 'ov5647_subdev_pad_ops.enum_frame_size')
>> drivers/media/platform/mxc/capture/ov5647_mipi.c:1523:34: error: initialization of 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_frame_interval_enum *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_pad_config *, struct v4l2_subdev_frame_interval_enum *)' [-Werror=incompatible-pointer-types]
    1523 |         .enum_frame_interval   = ov5647_enum_frameintervals,
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/ov5647_mipi.c:1523:34: note: (near initialization for 'ov5647_subdev_pad_ops.enum_frame_interval')
>> drivers/media/platform/mxc/capture/ov5647_mipi.c:1524:34: error: initialization of 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_mbus_code_enum *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_pad_config *, struct v4l2_subdev_mbus_code_enum *)' [-Werror=incompatible-pointer-types]
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
>> drivers/media/platform/mxc/capture/ov5647_mipi.c:1532:27: error: 'ov5647_get_register' undeclared here (not in a function); did you mean 'ov5647_get_shutter'?
    1532 |         .g_register     = ov5647_get_register,
         |                           ^~~~~~~~~~~~~~~~~~~
         |                           ov5647_get_shutter
   drivers/media/platform/mxc/capture/ov5647_mipi.c:1533:27: error: 'ov5647_set_register' undeclared here (not in a function); did you mean 'ov5647_set_shutter'?
    1533 |         .s_register     = ov5647_set_register,
         |                           ^~~~~~~~~~~~~~~~~~~
         |                           ov5647_set_shutter
   cc1: some warnings being treated as errors


vim +320 drivers/media/platform/mxc/capture/ov5647_mipi.c

c540262b9a9248 Robby Cai 2019-09-27  313  
c540262b9a9248 Robby Cai 2019-09-27  314  static struct i2c_driver ov5647_i2c_driver = {
c540262b9a9248 Robby Cai 2019-09-27  315  	.driver = {
c540262b9a9248 Robby Cai 2019-09-27  316  		  .owner = THIS_MODULE,
c540262b9a9248 Robby Cai 2019-09-27  317  		  .name  = "ov5647_mipi",
c540262b9a9248 Robby Cai 2019-09-27  318  		  },
c540262b9a9248 Robby Cai 2019-09-27  319  	.probe  = ov5647_probe,
c540262b9a9248 Robby Cai 2019-09-27 @320  	.remove = ov5647_remove,
c540262b9a9248 Robby Cai 2019-09-27  321  	.id_table = ov5647_id,
c540262b9a9248 Robby Cai 2019-09-27  322  };
c540262b9a9248 Robby Cai 2019-09-27  323  

:::::: The code at line 320 was first introduced by commit
:::::: c540262b9a924882cfa56687e832a6978c067469 media: capture: add mipi camera ov5647 driver

:::::: TO: Robby Cai <robby.cai@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
