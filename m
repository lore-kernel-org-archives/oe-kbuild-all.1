Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B0CC386
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Mar 2023 23:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678231648; x=1709767648;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cwt0umh9gAv9fnFJfKTMwXwWbiW0gQ2HSoNZbuIXkUo=;
  b=A59OGinq8XxZ9c+cc4lEE/hlGxwmncqf33Q5kk8Y0lMHSEq3PgF4X6sZ
   AYmDSYO0jtgTOOSQ3qi9VghDsk9q7phjgVf6Yd/VDrWSLKdg6WFMVRFqH
   qp0cEjokAsblRWgUg4L+JtQdx+kZl5qrthCYyK0WSanATeASPd2tM1WLH
   PbDy0hprRnxhlmKNusNAnuRsJPcQlAvwk0T/gzjh1mcZ1+rDBJSAiUf2u
   SqlU/qNJPfWLVS3y2DiXDIW0J4NTtoeraBBYKnOnkrE10W8e08iA20FqX
   Y14tVyFKIOaVIH/gOFvFy34+kUZ6l/tujVSzUe8Bjxjk7IjnlnRIvrXQh
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="422272297"
X-IronPort-AV: E=Sophos;i="5.98,242,1673942400"; 
   d="scan'208";a="422272297"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2023 15:27:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="786880363"
X-IronPort-AV: E=Sophos;i="5.98,242,1673942400"; 
   d="scan'208";a="786880363"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 07 Mar 2023 15:27:26 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZgiM-0001gT-00;
	Tue, 07 Mar 2023 23:27:26 +0000
Date: Wed, 8 Mar 2023 07:27:04 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 03/10] media: v4l: async: Simplify async sub-device fwnode
 matching
Message-ID: <202303080717.tTgPBoy5-lkp@intel.com>
References: <20230307212038.968381-4-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230307212038.968381-4-sakari.ailus@linux.intel.com>

Hi Sakari,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on media-tree/master]
[also build test WARNING on tegra/for-next rockchip/for-next linus/master v6.3-rc1 next-20230307]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sakari-Ailus/media-v4l-async-Return-async-sub-devices-to-subnotifier-list/20230308-053012
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20230307212038.968381-4-sakari.ailus%40linux.intel.com
patch subject: [RFC 03/10] media: v4l: async: Simplify async sub-device fwnode matching
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230308/202303080717.tTgPBoy5-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/c19cc215211fbc384cd8657174ab3d90f784b3f3
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Sakari-Ailus/media-v4l-async-Return-async-sub-devices-to-subnotifier-list/20230308-053012
        git checkout c19cc215211fbc384cd8657174ab3d90f784b3f3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash drivers/media/i2c/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303080717.tTgPBoy5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/i2c/max9286.c: In function 'max9286_v4l2_register':
>> drivers/media/i2c/max9286.c:1096:9: warning: this 'if' clause does not guard... [-Wmisleading-indentation]
    1096 |         if (ret < 0)
         |         ^~
   drivers/media/i2c/max9286.c:1098:17: note: ...this statement, but the latter is misleadingly indented as if it were guarded by the 'if'
    1098 |                 goto err_async;
         |                 ^~~~
   drivers/media/i2c/max9286.c:1098:17: error: label 'err_async' used but not defined
   drivers/media/i2c/max9286.c: At top level:
   drivers/media/i2c/max9286.c:1101:9: error: expected identifier or '(' before 'return'
    1101 |         return 0;
         |         ^~~~~~
   drivers/media/i2c/max9286.c:1103:10: error: expected '=', ',', ';', 'asm' or '__attribute__' before ':' token
    1103 | err_async:
         |          ^
>> drivers/media/i2c/max9286.c:1105:9: warning: data definition has no type or storage class
    1105 |         max9286_v4l2_notifier_unregister(priv);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/max9286.c:1105:9: error: type defaults to 'int' in declaration of 'max9286_v4l2_notifier_unregister' [-Werror=implicit-int]
>> drivers/media/i2c/max9286.c:1105:9: warning: parameter names (without types) in function declaration
   drivers/media/i2c/max9286.c:1105:9: error: conflicting types for 'max9286_v4l2_notifier_unregister'; have 'int()'
   drivers/media/i2c/max9286.c:778:13: note: previous definition of 'max9286_v4l2_notifier_unregister' with type 'void(struct max9286_priv *)'
     778 | static void max9286_v4l2_notifier_unregister(struct max9286_priv *priv)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/max9286.c:1107:9: error: expected identifier or '(' before 'return'
    1107 |         return ret;
         |         ^~~~~~
   drivers/media/i2c/max9286.c:1108:1: error: expected identifier or '(' before '}' token
    1108 | }
         | ^
   drivers/media/i2c/max9286.c:778:13: warning: 'max9286_v4l2_notifier_unregister' defined but not used [-Wunused-function]
     778 | static void max9286_v4l2_notifier_unregister(struct max9286_priv *priv)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/if +1096 drivers/media/i2c/max9286.c

  1050	
  1051	static int max9286_v4l2_register(struct max9286_priv *priv)
  1052	{
  1053		struct device *dev = &priv->client->dev;
  1054		int ret;
  1055		int i;
  1056	
  1057		/* Register v4l2 async notifiers for connected Camera subdevices */
  1058		ret = max9286_v4l2_notifier_register(priv);
  1059		if (ret) {
  1060			dev_err(dev, "Unable to register V4L2 async notifiers\n");
  1061			return ret;
  1062		}
  1063	
  1064		/* Configure V4L2 for the MAX9286 itself */
  1065	
  1066		for (i = 0; i < MAX9286_N_SINKS; i++)
  1067			max9286_init_format(&priv->fmt[i]);
  1068	
  1069		v4l2_i2c_subdev_init(&priv->sd, priv->client, &max9286_subdev_ops);
  1070		priv->sd.internal_ops = &max9286_subdev_internal_ops;
  1071		priv->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
  1072	
  1073		v4l2_ctrl_handler_init(&priv->ctrls, 1);
  1074		priv->pixelrate_ctrl = v4l2_ctrl_new_std(&priv->ctrls,
  1075							 &max9286_ctrl_ops,
  1076							 V4L2_CID_PIXEL_RATE,
  1077							 1, INT_MAX, 1, 50000000);
  1078	
  1079		priv->sd.ctrl_handler = &priv->ctrls;
  1080		ret = priv->ctrls.error;
  1081		if (ret)
  1082			goto err_async;
  1083	
  1084		priv->sd.entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
  1085		priv->sd.entity.ops = &max9286_media_ops;
  1086	
  1087		priv->pads[MAX9286_SRC_PAD].flags = MEDIA_PAD_FL_SOURCE;
  1088		for (i = 0; i < MAX9286_SRC_PAD; i++)
  1089			priv->pads[i].flags = MEDIA_PAD_FL_SINK;
  1090		ret = media_entity_pads_init(&priv->sd.entity, MAX9286_N_PADS,
  1091					     priv->pads);
  1092		if (ret)
  1093			goto err_async;
  1094	
  1095		ret = v4l2_async_register_subdev(&priv->sd);
> 1096		if (ret < 0)
  1097			dev_err(dev, "Unable to register subdevice\n");
> 1098			goto err_async;
  1099		}
  1100	
  1101		return 0;
  1102	
> 1103	err_async:
  1104		v4l2_ctrl_handler_free(&priv->ctrls);
> 1105		max9286_v4l2_notifier_unregister(priv);
  1106	
  1107		return ret;
  1108	}
  1109	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
