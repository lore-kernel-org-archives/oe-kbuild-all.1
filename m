Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5BAE81C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Dec 2023 01:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fQ4ymGJ/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702604513; x=1734140513;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2f2ldfcD96ydo8uBY05Nrt4yDX6/LfDfHIJsrF4YP28=;
  b=fQ4ymGJ/FZ27vdC+Bl/5LSKkaLjxaMwJCdDnvZ8DUX80LJfeUP2pwCPY
   WnEdQ0iaJejlnKTpwZCqvMkGX7zpPCn1BJZlExAwJo4GLxatwuS8pLaCa
   bpeftcONHk84HbHnk1ndxKeonjJW9PzDD6QjHfp0wszTZw4RRPwpG25L2
   ub8/pLD6LoscbVoJrda4dduDzs55+nj2UcmkVNN5C7xHcDny9XFwo8lQT
   qJEgNmJxjJdFRbwp5ixjFfPjw9n1MAHgIECujOrsq9YCNt5/hFh2+bFIO
   ziNmcC8DgrtqF2lD1FXSKONCiAl20gLrbknq+I0/S+ZKwc2/2Ze90goWt
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="394957790"
X-IronPort-AV: E=Sophos;i="6.04,277,1695711600"; 
   d="scan'208";a="394957790"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 17:41:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="947791742"
X-IronPort-AV: E=Sophos;i="6.04,277,1695711600"; 
   d="scan'208";a="947791742"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 14 Dec 2023 17:41:50 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDxD2-000MxX-0w;
	Fri, 15 Dec 2023 01:41:48 +0000
Date: Fri, 15 Dec 2023 09:41:40 +0800
From: kernel test robot <lkp@intel.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, Steev Klimaszewski <steev@kali.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [steev:lenovo-x13s-v6.7-rc5 128/138]
 drivers/media/i2c/ar1337.c:349:68: error: passing argument 2 of
 'v4l2_subdev_get_pad_format' from incompatible pointer type
Message-ID: <202312150940.woorfJmY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/steev/linux lenovo-x13s-v6.7-rc5
head:   b8cd563c115473e27fa4778c1eca7b25f6f9a7ee
commit: 3816d49b9f2ab3e4b7b94aa5b5a8207c062b504d [128/138] media: i2c: ar1337: Add OnSemi AR1337 CMOS sensor
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20231215/202312150940.woorfJmY-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231215/202312150940.woorfJmY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312150940.woorfJmY-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/media/i2c/ar1337.c: In function 'ar1337_set_gain':
>> drivers/media/i2c/ar1337.c:281:13: warning: unused variable 'ret' [-Wunused-variable]
     281 |         int ret;
         |             ^~~
   In file included from include/media/v4l2-device.h:13,
                    from drivers/media/i2c/ar1337.c:18:
   drivers/media/i2c/ar1337.c: In function 'ar1337_get_fmt':
>> drivers/media/i2c/ar1337.c:349:68: error: passing argument 2 of 'v4l2_subdev_get_pad_format' from incompatible pointer type [-Werror=incompatible-pointer-types]
     349 |                 framefmt = v4l2_subdev_get_try_format(&ar1337->sd, cfg,
         |                                                                    ^~~
         |                                                                    |
         |                                                                    struct v4l2_subdev_pad_config *
   include/media/v4l2-subdev.h:1212:40: note: in definition of macro 'v4l2_subdev_get_try_format'
    1212 |         v4l2_subdev_get_pad_format(sd, state, pad)
         |                                        ^~~~~
   include/media/v4l2-subdev.h:1157:54: note: expected 'struct v4l2_subdev_state *' but argument is of type 'struct v4l2_subdev_pad_config *'
    1157 |                            struct v4l2_subdev_state *state,
         |                            ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~
   drivers/media/i2c/ar1337.c: In function 'ar1337_set_fmt':
   drivers/media/i2c/ar1337.c:401:57: error: passing argument 2 of 'v4l2_subdev_get_pad_format' from incompatible pointer type [-Werror=incompatible-pointer-types]
     401 |                 format = v4l2_subdev_get_try_format(sd, cfg, fmt->pad);
         |                                                         ^~~
         |                                                         |
         |                                                         struct v4l2_subdev_pad_config *
   include/media/v4l2-subdev.h:1212:40: note: in definition of macro 'v4l2_subdev_get_try_format'
    1212 |         v4l2_subdev_get_pad_format(sd, state, pad)
         |                                        ^~~~~
   include/media/v4l2-subdev.h:1157:54: note: expected 'struct v4l2_subdev_state *' but argument is of type 'struct v4l2_subdev_pad_config *'
    1157 |                            struct v4l2_subdev_state *state,
         |                            ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~
   drivers/media/i2c/ar1337.c: At top level:
>> drivers/media/i2c/ar1337.c:560:21: error: initialization of 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_pad_config *)' [-Werror=incompatible-pointer-types]
     560 |         .init_cfg = ar1337_entity_init_cfg,
         |                     ^~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ar1337.c:560:21: note: (near initialization for 'ar1337_pad_ops.init_cfg')
>> drivers/media/i2c/ar1337.c:561:27: error: initialization of 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_mbus_code_enum *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_pad_config *, struct v4l2_subdev_mbus_code_enum *)' [-Werror=incompatible-pointer-types]
     561 |         .enum_mbus_code = ar1337_enum_mbus_code,
         |                           ^~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ar1337.c:561:27: note: (near initialization for 'ar1337_pad_ops.enum_mbus_code')
>> drivers/media/i2c/ar1337.c:562:20: error: initialization of 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_pad_config *, struct v4l2_subdev_format *)' [-Werror=incompatible-pointer-types]
     562 |         .get_fmt = ar1337_get_fmt,
         |                    ^~~~~~~~~~~~~~
   drivers/media/i2c/ar1337.c:562:20: note: (near initialization for 'ar1337_pad_ops.get_fmt')
   drivers/media/i2c/ar1337.c:563:20: error: initialization of 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_pad_config *, struct v4l2_subdev_format *)' [-Werror=incompatible-pointer-types]
     563 |         .set_fmt = ar1337_set_fmt,
         |                    ^~~~~~~~~~~~~~
   drivers/media/i2c/ar1337.c:563:20: note: (near initialization for 'ar1337_pad_ops.set_fmt')
   drivers/media/i2c/ar1337.c: In function 'ar1337_probe':
>> drivers/media/i2c/ar1337.c:597:22: error: too few arguments to function 'v4l2_fwnode_endpoint_alloc_parse'
     597 |         ar1337->ep = v4l2_fwnode_endpoint_alloc_parse(endpoint);
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/media/i2c/ar1337.c:19:
   include/media/v4l2-fwnode.h:282:5: note: declared here
     282 | int v4l2_fwnode_endpoint_alloc_parse(struct fwnode_handle *fwnode,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/i2c/ar1337.c:606:37: error: 'V4L2_MBUS_CSI2' undeclared (first use in this function); did you mean 'V4L2_MBUS_CSI1'?
     606 |         if (ar1337->ep->bus_type != V4L2_MBUS_CSI2) {
         |                                     ^~~~~~~~~~~~~~
         |                                     V4L2_MBUS_CSI1
   drivers/media/i2c/ar1337.c:606:37: note: each undeclared identifier is reported only once for each function it appears in
   drivers/media/i2c/ar1337.c: At top level:
>> drivers/media/i2c/ar1337.c:763:10: error: 'struct i2c_driver' has no member named 'probe_new'
     763 |         .probe_new  = ar1337_probe,
         |          ^~~~~~~~~
>> drivers/media/i2c/ar1337.c:763:23: warning: initialization of 'unsigned int' from 'int (*)(struct i2c_client *)' makes integer from pointer without a cast [-Wint-conversion]
     763 |         .probe_new  = ar1337_probe,
         |                       ^~~~~~~~~~~~
   drivers/media/i2c/ar1337.c:763:23: note: (near initialization for 'ar1337_i2c_driver.class')
>> drivers/media/i2c/ar1337.c:763:23: error: initializer element is not computable at load time
   drivers/media/i2c/ar1337.c:763:23: note: (near initialization for 'ar1337_i2c_driver.class')
>> drivers/media/i2c/ar1337.c:764:19: error: initialization of 'void (*)(struct i2c_client *)' from incompatible pointer type 'int (*)(struct i2c_client *)' [-Werror=incompatible-pointer-types]
     764 |         .remove = ar1337_remove,
         |                   ^~~~~~~~~~~~~
   drivers/media/i2c/ar1337.c:764:19: note: (near initialization for 'ar1337_i2c_driver.remove')
   cc1: some warnings being treated as errors


vim +/v4l2_subdev_get_pad_format +349 drivers/media/i2c/ar1337.c

   229	
   230	static int ar1337_set_register_array(struct ar1337 *ar1337,
   231					     const struct ar1337_regval *settings,
   232					     unsigned int num_settings)
   233	{
   234		unsigned int i;
   235		int ret;
   236	
   237		for (i = 0; i < num_settings; ++i, ++settings) {
   238			ret = ar1337_write_reg16(ar1337, settings->reg, settings->val);
   239			if (ret < 0)
   240				return ret;
   241	
   242			/* Settle time is 10ms for all registers */
   243			msleep(10);
   244		}
   245	
   246		return 0;
   247	}
   248	/*
   249	static int ar1337_write_buffered_reg(struct ar1337 *ar1337, u16 address_low,
   250					     u8 nr_regs, u32 value)
   251	{
   252		unsigned int i;
   253		int ret;
   254	
   255		ret = ar1337_write_reg8(ar1337, AR1337_REG_HOLD, 0x01);
   256		if (ret) {
   257			dev_err(ar1337->dev, "Error setting hold register\n");
   258			return ret;
   259		}
   260	
   261		for (i = 0; i < nr_regs; i++) {
   262			ret = ar1337_write_reg(ar1337, address_low + i,
   263					       (u8)(value >> (i * 8)));
   264			if (ret) {
   265				dev_err(ar1337->dev, "Error writing buffered registers\n");
   266				return ret;
   267			}
   268		}
   269	
   270		ret = ar1337_write_reg8(ar1337, AR1337_REG_HOLD, 0x00);
   271		if (ret) {
   272			dev_err(ar1337->dev, "Error setting hold register\n");
   273			return ret;
   274		}
   275	
   276		return ret;
   277	}
   278	*/
   279	static int ar1337_set_gain(struct ar1337 *ar1337, u32 value)
   280	{
 > 281		int ret;
   282	/*
   283		ret = ar1337_write_buffered_reg(ar1337, AR1337_GAIN_HIGH, 1,
   284						(u8)((value >> 8) & 0xFF));
   285		if (ret < 0)
   286			return ret;
   287	
   288		ret = ar1337_write_buffered_reg(ar1337, AR1337_GAIN_HIGH, 1,
   289						(u8)((value) & 0xFF));
   290		if (ret < 0)
   291			return ret;
   292	*/
   293		return 0;
   294	}
   295	
   296	/* Stop streaming */
   297	static int ar1337_stop_streaming(struct ar1337 *ar1337)
   298	{
   299		return ar1337_write_reg8(ar1337, AR1337_REG_MODE, 0x00);
   300	}
   301	
   302	static int ar1337_set_ctrl(struct v4l2_ctrl *ctrl)
   303	{
   304		struct ar1337 *ar1337 = container_of(ctrl->handler,
   305						     struct ar1337, ctrls);
   306		int ret = 0;
   307	
   308		/* V4L2 controls values will be applied only when power is already up */
   309		if (!pm_runtime_get_if_in_use(ar1337->dev))
   310			return 0;
   311	
   312		switch (ctrl->id) {
   313		case V4L2_CID_GAIN:
   314			ret = ar1337_set_gain(ar1337, ctrl->val);
   315			break;
   316		default:
   317			ret = -EINVAL;
   318			break;
   319		}
   320	
   321		pm_runtime_put(ar1337->dev);
   322	
   323		return ret;
   324	}
   325	
   326	static const struct v4l2_ctrl_ops ar1337_ctrl_ops = {
   327		.s_ctrl = ar1337_set_ctrl,
   328	};
   329	
   330	static int ar1337_enum_mbus_code(struct v4l2_subdev *sd,
   331					 struct v4l2_subdev_pad_config *cfg,
   332					 struct v4l2_subdev_mbus_code_enum *code)
   333	{
   334		code->code = AR1337_DEFAULT_FORMAT;
   335	
   336		return 0;
   337	}
   338	
   339	static int ar1337_get_fmt(struct v4l2_subdev *sd,
   340				  struct v4l2_subdev_pad_config *cfg,
   341				  struct v4l2_subdev_format *fmt)
   342	{
   343		struct ar1337 *ar1337 = to_ar1337(sd);
   344		struct v4l2_mbus_framefmt *framefmt;
   345	
   346		mutex_lock(&ar1337->lock);
   347	
   348		if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
 > 349			framefmt = v4l2_subdev_get_try_format(&ar1337->sd, cfg,
   350							      fmt->pad);
   351		else
   352			framefmt = &ar1337->current_format;
   353	
   354		fmt->format = *framefmt;
   355	
   356		mutex_unlock(&ar1337->lock);
   357	
   358		return 0;
   359	}
   360	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
