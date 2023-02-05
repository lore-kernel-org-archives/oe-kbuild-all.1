Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB1BB7F
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Feb 2023 05:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675573630; x=1707109630;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5JXrukEZSM1WTtIX4UqWWuzq2h+hRTqo8bt76Db9pig=;
  b=L6DC7cSFHdvz7CGH8tdp5/ksV1lJbZGRdkfzw84yF+t3VrGk7BOO7KB1
   CCtQAyHlV2pJiL8ApL0Hzn7McgZSorClp/zKe/mI3qeuUfvhWVoVbiYPs
   AXI4mcRwi8k0w3IbN8l6vAMiYU1oI2gP+Dlgu/LVXDfm5Uw+QI5aHwiSW
   wgsCXCZ//uEjSP/IV65YSjPWDlHicv/7inZGmq8GGHkiJyRtUY3QmhX7c
   UE+Fr+BSqGAJ8WW0AIvqoKVLjLo+2l3C8Kx1YFRidj0/mxPqOe1+w/CWA
   GvhIT9q92ZmKCR5uJ3Orj9IwVIP8pigH14AqSDB2wM87mOB67HHJv5zA6
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="393616028"
X-IronPort-AV: E=Sophos;i="5.97,274,1669104000"; 
   d="scan'208";a="393616028"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2023 21:07:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="734781667"
X-IronPort-AV: E=Sophos;i="5.97,274,1669104000"; 
   d="scan'208";a="734781667"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 04 Feb 2023 21:07:09 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOXF6-0001ks-1h;
	Sun, 05 Feb 2023 05:07:08 +0000
Date: Sun, 5 Feb 2023 13:06:32 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.2.x-imx 435/20209]
 drivers/staging/media/imx/gmsl-max9286.c:3016:9: warning: no previous
 prototype for 'analog_test_pattern_show'
Message-ID: <202302051232.odgbbM36-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Guoniu.zhou,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc 5.15-2.2.x-imx
head:   3248ffcb12d15a0e40b9a020ba362591b8137923
commit: f65e9a3520a70980a2c19750858ce5ce81ac86c6 [435/20209] media: staging: imx: add driver for GMSL MAX9286 device
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230205/202302051232.odgbbM36-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Freescale/linux-fslc/commit/f65e9a3520a70980a2c19750858ce5ce81ac86c6
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc 5.15-2.2.x-imx
        git checkout f65e9a3520a70980a2c19750858ce5ce81ac86c6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/accessibility/speakup/ drivers/base/power/ drivers/dma/ drivers/firmware/imx/ drivers/gpu/drm/bridge/ drivers/gpu/drm/imx/ drivers/i2c/busses/ drivers/input/touchscreen/ drivers/mailbox/ drivers/media/platform/ drivers/mtd/nand/raw/gpmi-nand/ drivers/net/ethernet/freescale/ drivers/net/phy/ drivers/pci/controller/dwc/ drivers/pci/controller/mobiveil/ drivers/power/supply/ drivers/pwm/ drivers/regulator/ drivers/rpmsg/ drivers/soc/imx/ drivers/staging/ drivers/thermal/ drivers/video/fbdev/ net/ sound/soc/fsl/ sound/soc/sof/imx/ sound/soc/sof/intel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/staging/media/imx/gmsl-max9286.c: In function 'max9271_write_reg':
   drivers/staging/media/imx/gmsl-max9286.c:2380:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
    2380 |         s32 ret;
         |             ^~~
   drivers/staging/media/imx/gmsl-max9286.c: At top level:
   drivers/staging/media/imx/gmsl-max9286.c:2989:35: error: initialization of 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_mbus_code_enum *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_pad_config *, struct v4l2_subdev_mbus_code_enum *)' [-Werror=incompatible-pointer-types]
    2989 |         .enum_mbus_code         = max9286_enum_mbus_code,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/imx/gmsl-max9286.c:2989:35: note: (near initialization for 'max9286_pad_ops.enum_mbus_code')
   drivers/staging/media/imx/gmsl-max9286.c:2990:35: error: initialization of 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_frame_size_enum *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_pad_config *, struct v4l2_subdev_frame_size_enum *)' [-Werror=incompatible-pointer-types]
    2990 |         .enum_frame_size        = max9286_enum_framesizes,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/imx/gmsl-max9286.c:2990:35: note: (near initialization for 'max9286_pad_ops.enum_frame_size')
   drivers/staging/media/imx/gmsl-max9286.c:2991:35: error: initialization of 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_frame_interval_enum *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_pad_config *, struct v4l2_subdev_frame_interval_enum *)' [-Werror=incompatible-pointer-types]
    2991 |         .enum_frame_interval    = max9286_enum_frame_interval,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/imx/gmsl-max9286.c:2991:35: note: (near initialization for 'max9286_pad_ops.enum_frame_interval')
   drivers/staging/media/imx/gmsl-max9286.c:2992:35: error: initialization of 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_pad_config *, struct v4l2_subdev_format *)' [-Werror=incompatible-pointer-types]
    2992 |         .get_fmt                = max9286_get_fmt,
         |                                   ^~~~~~~~~~~~~~~
   drivers/staging/media/imx/gmsl-max9286.c:2992:35: note: (near initialization for 'max9286_pad_ops.get_fmt')
   drivers/staging/media/imx/gmsl-max9286.c:2993:35: error: initialization of 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_pad_config *, struct v4l2_subdev_format *)' [-Werror=incompatible-pointer-types]
    2993 |         .set_fmt                = max9286_set_fmt,
         |                                   ^~~~~~~~~~~~~~~
   drivers/staging/media/imx/gmsl-max9286.c:2993:35: note: (near initialization for 'max9286_pad_ops.set_fmt')
>> drivers/staging/media/imx/gmsl-max9286.c:3016:9: warning: no previous prototype for 'analog_test_pattern_show' [-Wmissing-prototypes]
    3016 | ssize_t analog_test_pattern_show(struct device *dev,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/analog_test_pattern_show +3016 drivers/staging/media/imx/gmsl-max9286.c

  3015	
> 3016	ssize_t analog_test_pattern_show(struct device *dev,
  3017					 struct device_attribute *attr, char *buf)
  3018	{
  3019		struct v4l2_subdev *sd = dev_get_drvdata(dev);
  3020		struct sensor_data *max9286_data = subdev_to_sensor_data(sd);
  3021		u8 val = 0;
  3022	
  3023		ov10635_read_reg(max9286_data, 0, 0x370A, &val);
  3024		return sprintf(buf, "%s\n", (val & 0x4) ? "enabled" : "disabled");
  3025	}
  3026	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
