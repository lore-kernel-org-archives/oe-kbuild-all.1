Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD02133D2
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Oct 2023 06:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c+GOSQvc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697177240; x=1728713240;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1vi4quYsicXTaHgXOQ/XmvJELhMxmbbQAstL6UvPsAM=;
  b=c+GOSQvc7bcwWvM0S7EbtUjLcOyWIE2+HlL7aulkQ9jhcRnRm19TMT0a
   ujKMNnQZL1drV1h7nhyzJ5aUi7nXekRHm2nN0nMeOcEVGPk4xhLEp/kt7
   JaDKeu6go0efa2ANtuh0mCMyq0/8+CJ5tkJCPH3CqksJ27ynkuaw4Fv7k
   NHXvcUNF8XcITFiF8730ZHUjhOMuqsIdtNO7WIHzFM5Jj4xIMt3jw8+DQ
   lVE9o8P6Eeg2MuTpyhV7iRFT5S6/JAkdBu2ezfgMXm/yHy1jVtKbZuvva
   Hf7PT/V2DcVpax+bvTNbGNwyNxf9ajQ5Hr1O9RU5ljpGl1/Ti0ZVNSFkX
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="365369261"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; 
   d="scan'208";a="365369261"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 23:07:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="704494292"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; 
   d="scan'208";a="704494292"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 12 Oct 2023 23:07:18 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrBKO-0004On-0q;
	Fri, 13 Oct 2023 06:07:16 +0000
Date: Fri, 13 Oct 2023 14:07:05 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.1.x-imx 255/15768]
 drivers/staging/media/imx/imx8-mipi-csi2-sam.c:1556:18: warning: variable
 'len' set but not used
Message-ID: <202310131457.hDH7SOB8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Guoniu.zhou,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/Freescale/linux-fslc 6.1-2.1.x-imx
head:   3f41fbe42851375d3d5996e4bf9e9809e6c79517
commit: 196f8794fe335edc1fd97b5a0021bd46357d8878 [255/15768] LF-5810-03: media: csi2-sam: Kconfig: cleanup VIDEO_V4L2 due to community change
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20231013/202310131457.hDH7SOB8-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231013/202310131457.hDH7SOB8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310131457.hDH7SOB8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/staging/media/imx/imx8-mipi-csi2-sam.c: In function 'csis_get_remote_sensor_pad':
   drivers/staging/media/imx/imx8-mipi-csi2-sam.c:594:46: error: implicit declaration of function 'media_entity_remote_pad'; did you mean 'media_entity_remove_links'? [-Werror=implicit-function-declaration]
     594 |                                 source_pad = media_entity_remote_pad(sink_pad);
         |                                              ^~~~~~~~~~~~~~~~~~~~~~~
         |                                              media_entity_remove_links
   drivers/staging/media/imx/imx8-mipi-csi2-sam.c:594:44: warning: assignment to 'struct media_pad *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     594 |                                 source_pad = media_entity_remote_pad(sink_pad);
         |                                            ^
   drivers/staging/media/imx/imx8-mipi-csi2-sam.c: In function 'mipi_csis_imx8mn_parse_resets':
>> drivers/staging/media/imx/imx8-mipi-csi2-sam.c:1556:18: warning: variable 'len' set but not used [-Wunused-but-set-variable]
    1556 |         uint32_t len, rstc_num = 0;
         |                  ^~~
   drivers/staging/media/imx/imx8-mipi-csi2-sam.c: In function 'mipi_csis_probe':
   drivers/staging/media/imx/imx8-mipi-csi2-sam.c:1900:29: warning: variable 'mipi_sd' set but not used [-Wunused-but-set-variable]
    1900 |         struct v4l2_subdev *mipi_sd;
         |                             ^~~~~~~
   drivers/staging/media/imx/imx8-mipi-csi2-sam.c: In function 'csis_priv_ioctl':
   drivers/staging/media/imx/imx8-mipi-csi2-sam.c:1358:17: warning: ignoring return value of 'copy_from_user' declared with attribute 'warn_unused_result' [-Wunused-result]
    1358 |                 copy_from_user(arg, arg_user, sizeof(TYPE));\
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/imx/imx8-mipi-csi2-sam.c:1393:17: note: in expansion of macro 'USER_TO_KERNEL'
    1393 |                 USER_TO_KERNEL(struct csi_sam_format);
         |                 ^~~~~~~~~~~~~~
   drivers/staging/media/imx/imx8-mipi-csi2-sam.c:1358:17: warning: ignoring return value of 'copy_from_user' declared with attribute 'warn_unused_result' [-Wunused-result]
    1358 |                 copy_from_user(arg, arg_user, sizeof(TYPE));\
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/imx/imx8-mipi-csi2-sam.c:1398:17: note: in expansion of macro 'USER_TO_KERNEL'
    1398 |                 USER_TO_KERNEL(bool);
         |                 ^~~~~~~~~~~~~~
   drivers/staging/media/imx/imx8-mipi-csi2-sam.c: At top level:
>> drivers/staging/media/imx/imx8-mipi-csi2-sam.c:2060:12: warning: 'mipi_csis_runtime_resume' defined but not used [-Wunused-function]
    2060 | static int mipi_csis_runtime_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/media/imx/imx8-mipi-csi2-sam.c:2046:12: warning: 'mipi_csis_runtime_suspend' defined but not used [-Wunused-function]
    2046 | static int mipi_csis_runtime_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/media/imx/imx8-mipi-csi2-sam.c:2033:12: warning: 'mipi_csis_system_resume' defined but not used [-Wunused-function]
    2033 | static int mipi_csis_system_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/media/imx/imx8-mipi-csi2-sam.c:2028:12: warning: 'mipi_csis_system_suspend' defined but not used [-Wunused-function]
    2028 | static int mipi_csis_system_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/len +1556 drivers/staging/media/imx/imx8-mipi-csi2-sam.c

d6d0fbf683aa60 Guoniu.zhou 2019-10-25  1543  
4d5e92874cef37 Guoniu.zhou 2020-08-21  1544  /*
4d5e92874cef37 Guoniu.zhou 2020-08-21  1545   * IMX8MN platform data
4d5e92874cef37 Guoniu.zhou 2020-08-21  1546   */
4d5e92874cef37 Guoniu.zhou 2020-08-21  1547  static int mipi_csis_imx8mn_parse_resets(struct csi_state *state)
d6d0fbf683aa60 Guoniu.zhou 2019-10-25  1548  {
d6d0fbf683aa60 Guoniu.zhou 2019-10-25  1549  	int ret;
d6d0fbf683aa60 Guoniu.zhou 2019-10-25  1550  	struct device *dev = state->dev;
d6d0fbf683aa60 Guoniu.zhou 2019-10-25  1551  	struct device_node *np = dev->of_node;
d6d0fbf683aa60 Guoniu.zhou 2019-10-25  1552  	struct device_node *parent, *child;
d6d0fbf683aa60 Guoniu.zhou 2019-10-25  1553  	struct of_phandle_args args;
d6d0fbf683aa60 Guoniu.zhou 2019-10-25  1554  	struct reset_control *rstc;
d6d0fbf683aa60 Guoniu.zhou 2019-10-25  1555  	const char *compat;
d6d0fbf683aa60 Guoniu.zhou 2019-10-25 @1556  	uint32_t len, rstc_num = 0;
d6d0fbf683aa60 Guoniu.zhou 2019-10-25  1557  
d6d0fbf683aa60 Guoniu.zhou 2019-10-25  1558  	ret = of_parse_phandle_with_args(np, "resets", "#reset-cells",
d6d0fbf683aa60 Guoniu.zhou 2019-10-25  1559  					 0, &args);
d6d0fbf683aa60 Guoniu.zhou 2019-10-25  1560  	if (ret)
d6d0fbf683aa60 Guoniu.zhou 2019-10-25  1561  		return ret;
d6d0fbf683aa60 Guoniu.zhou 2019-10-25  1562  
d6d0fbf683aa60 Guoniu.zhou 2019-10-25  1563  	parent = args.np;
d6d0fbf683aa60 Guoniu.zhou 2019-10-25  1564  	for_each_child_of_node(parent, child) {
d6d0fbf683aa60 Guoniu.zhou 2019-10-25  1565  		compat = of_get_property(child, "compatible", NULL);
d6d0fbf683aa60 Guoniu.zhou 2019-10-25  1566  		if (!compat)
d6d0fbf683aa60 Guoniu.zhou 2019-10-25  1567  			continue;
d6d0fbf683aa60 Guoniu.zhou 2019-10-25  1568  
d6d0fbf683aa60 Guoniu.zhou 2019-10-25  1569  		rstc = of_reset_control_array_get(child, false, false, true);
d6d0fbf683aa60 Guoniu.zhou 2019-10-25  1570  		if (IS_ERR(rstc))
d6d0fbf683aa60 Guoniu.zhou 2019-10-25  1571  			continue;
d6d0fbf683aa60 Guoniu.zhou 2019-10-25  1572  
d6d0fbf683aa60 Guoniu.zhou 2019-10-25  1573  		len = strlen(compat);
d6d0fbf683aa60 Guoniu.zhou 2019-10-25  1574  		if (!of_compat_cmp("csi,soft-resetn", compat, len)) {
d6d0fbf683aa60 Guoniu.zhou 2019-10-25  1575  			state->soft_resetn = rstc;
d6d0fbf683aa60 Guoniu.zhou 2019-10-25  1576  			rstc_num++;
d6d0fbf683aa60 Guoniu.zhou 2019-10-25  1577  		} else if (!of_compat_cmp("csi,clk-enable", compat, len)) {
d6d0fbf683aa60 Guoniu.zhou 2019-10-25  1578  			state->clk_enable = rstc;
d6d0fbf683aa60 Guoniu.zhou 2019-10-25  1579  			rstc_num++;
d6d0fbf683aa60 Guoniu.zhou 2019-10-25  1580  		} else if (!of_compat_cmp("csi,mipi-reset", compat, len)) {
d6d0fbf683aa60 Guoniu.zhou 2019-10-25  1581  			state->mipi_reset = rstc;
d6d0fbf683aa60 Guoniu.zhou 2019-10-25  1582  			rstc_num++;
d6d0fbf683aa60 Guoniu.zhou 2019-10-25  1583  		} else {
d6d0fbf683aa60 Guoniu.zhou 2019-10-25  1584  			dev_warn(dev, "invalid csis reset node: %s\n", compat);
d6d0fbf683aa60 Guoniu.zhou 2019-10-25  1585  		}
d6d0fbf683aa60 Guoniu.zhou 2019-10-25  1586  	}
d6d0fbf683aa60 Guoniu.zhou 2019-10-25  1587  
d6d0fbf683aa60 Guoniu.zhou 2019-10-25  1588  	if (!rstc_num) {
d6d0fbf683aa60 Guoniu.zhou 2019-10-25  1589  		dev_err(dev, "no invalid reset control exists\n");
d6d0fbf683aa60 Guoniu.zhou 2019-10-25  1590  		return -EINVAL;
d6d0fbf683aa60 Guoniu.zhou 2019-10-25  1591  	}
d6d0fbf683aa60 Guoniu.zhou 2019-10-25  1592  	of_node_put(parent);
d6d0fbf683aa60 Guoniu.zhou 2019-10-25  1593  
d6d0fbf683aa60 Guoniu.zhou 2019-10-25  1594  	return 0;
d6d0fbf683aa60 Guoniu.zhou 2019-10-25  1595  }
d6d0fbf683aa60 Guoniu.zhou 2019-10-25  1596  

:::::: The code at line 1556 was first introduced by commit
:::::: d6d0fbf683aa60f8d27adaab7b5e54343d90d6f6 staging: media: imx: add V4L2 subdev driver for MIPI CSI2 of Samsung

:::::: TO: Guoniu.zhou <guoniu.zhou@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
