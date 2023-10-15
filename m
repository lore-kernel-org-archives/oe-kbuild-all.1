Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A62C195
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Oct 2023 00:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z1BRKVF8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697328791; x=1728864791;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=i8SY4ri4Jx7eahpoAdjcvx2Lc4gBQt9UJe8K1GVqj5s=;
  b=Z1BRKVF8ulqz17oJZ8wbciUz59dhUBcZalCxJCgbvEPN49wXsinUOWQU
   rfWCuAMYOIQHN85502Ek9mSXYsSiqQLrojyx25zVqFZhloNfE9IxvnxHp
   44M1i1cb20KpMq4RCso06NFlm/ycpYxEEJBdkN0KrXXbmOzbbC7YZrSMA
   iHWSukH5FG4wpR9CcST65EO4a8u82c11KHEHSFbOlJ8cF++RAigKNfHjk
   gtRWDaEG+KHcis1OzSdN+qzxiA2tJuRcdltidylAoaUzTFp7x41SWFBYv
   jeepYBdH51XFuY6VQwAbjyVGw+Jb/jsfyWIf+/5ypZ5XFOFziGY2a65pV
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="365618192"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="365618192"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 17:13:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="731805311"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="731805311"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 14 Oct 2023 17:13:08 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrokk-0006qf-16;
	Sun, 15 Oct 2023 00:13:06 +0000
Date: Sun, 15 Oct 2023 08:12:09 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/639 6206/24603]
 drivers/staging/media/imx/imx8-mipi-csi2-sam.c:1547:18: warning: variable
 'len' set but not used
Message-ID: <202310150840.gK1YB7TK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/639
head:   857fbf7cebaba3b1ffccc558deee1d13ac0e11d7
commit: 6e93c0ab4bc6ae1ea6ea17c5a358da115ed5a441 [6206/24603] staging: media: imx8-mipi: remove obsolete modversions.h includes
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20231015/202310150840.gK1YB7TK-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231015/202310150840.gK1YB7TK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310150840.gK1YB7TK-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/staging/media/imx/imx8-mipi-csi2-sam.c: In function 'mipi_csis_imx8mn_parse_resets':
>> drivers/staging/media/imx/imx8-mipi-csi2-sam.c:1547:18: warning: variable 'len' set but not used [-Wunused-but-set-variable]
    1547 |         uint32_t len, rstc_num = 0;
         |                  ^~~
   drivers/staging/media/imx/imx8-mipi-csi2-sam.c: In function 'mipi_csis_probe':
   drivers/staging/media/imx/imx8-mipi-csi2-sam.c:1815:29: warning: variable 'mipi_sd' set but not used [-Wunused-but-set-variable]
    1815 |         struct v4l2_subdev *mipi_sd;
         |                             ^~~~~~~
   drivers/staging/media/imx/imx8-mipi-csi2-sam.c: In function 'csis_priv_ioctl':
   drivers/staging/media/imx/imx8-mipi-csi2-sam.c:1349:17: warning: ignoring return value of 'copy_from_user' declared with attribute 'warn_unused_result' [-Wunused-result]
    1349 |                 copy_from_user(arg, arg_user, sizeof(TYPE));\
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/imx/imx8-mipi-csi2-sam.c:1384:17: note: in expansion of macro 'USER_TO_KERNEL'
    1384 |                 USER_TO_KERNEL(struct csi_sam_format);
         |                 ^~~~~~~~~~~~~~
   drivers/staging/media/imx/imx8-mipi-csi2-sam.c:1349:17: warning: ignoring return value of 'copy_from_user' declared with attribute 'warn_unused_result' [-Wunused-result]
    1349 |                 copy_from_user(arg, arg_user, sizeof(TYPE));\
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/imx/imx8-mipi-csi2-sam.c:1389:17: note: in expansion of macro 'USER_TO_KERNEL'
    1389 |                 USER_TO_KERNEL(bool);
         |                 ^~~~~~~~~~~~~~
   drivers/staging/media/imx/imx8-mipi-csi2-sam.c: At top level:
>> drivers/staging/media/imx/imx8-mipi-csi2-sam.c:1974:12: warning: 'mipi_csis_runtime_resume' defined but not used [-Wunused-function]
    1974 | static int mipi_csis_runtime_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/media/imx/imx8-mipi-csi2-sam.c:1960:12: warning: 'mipi_csis_runtime_suspend' defined but not used [-Wunused-function]
    1960 | static int mipi_csis_runtime_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/media/imx/imx8-mipi-csi2-sam.c:1947:12: warning: 'mipi_csis_system_resume' defined but not used [-Wunused-function]
    1947 | static int mipi_csis_system_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/media/imx/imx8-mipi-csi2-sam.c:1942:12: warning: 'mipi_csis_system_suspend' defined but not used [-Wunused-function]
    1942 | static int mipi_csis_system_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/imx/imx8-mipi-csi2-sam.c: In function 'csis_priv_ioctl':
   drivers/staging/media/imx/imx8-mipi-csi2-sam.c:1390:23: warning: using dangling pointer 'arg' to 'tmp' [-Wdangling-pointer=]
    1390 |                 ret = csis_s_hdr(sd, *(bool *) arg);
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/imx/imx8-mipi-csi2-sam.c:1347:22: note: 'tmp' declared here
    1347 |                 TYPE tmp; \
         |                      ^~~
   drivers/staging/media/imx/imx8-mipi-csi2-sam.c:1389:17: note: in expansion of macro 'USER_TO_KERNEL'
    1389 |                 USER_TO_KERNEL(bool);
         |                 ^~~~~~~~~~~~~~
   drivers/staging/media/imx/imx8-mipi-csi2-sam.c:1385:23: warning: using dangling pointer 'arg' to 'tmp' [-Wdangling-pointer=]
    1385 |                 ret = csis_s_fmt(sd, (struct csi_sam_format *)arg);
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/imx/imx8-mipi-csi2-sam.c:1347:22: note: 'tmp' declared here
    1347 |                 TYPE tmp; \
         |                      ^~~
   drivers/staging/media/imx/imx8-mipi-csi2-sam.c:1384:17: note: in expansion of macro 'USER_TO_KERNEL'
    1384 |                 USER_TO_KERNEL(struct csi_sam_format);
         |                 ^~~~~~~~~~~~~~
   In function 'csis_s_fmt',
       inlined from 'csis_priv_ioctl' at drivers/staging/media/imx/imx8-mipi-csi2-sam.c:1385:9:
   drivers/staging/media/imx/imx8-mipi-csi2-sam.c:1286:20: warning: using a dangling pointer to 'tmp' [-Wdangling-pointer=]
    1286 |         switch (fmt->format) {
         |                 ~~~^~~~~~~~
   drivers/staging/media/imx/imx8-mipi-csi2-sam.c: In function 'csis_priv_ioctl':
   drivers/staging/media/imx/imx8-mipi-csi2-sam.c:1347:22: note: 'tmp' declared here
    1347 |                 TYPE tmp; \
         |                      ^~~
   drivers/staging/media/imx/imx8-mipi-csi2-sam.c:1384:17: note: in expansion of macro 'USER_TO_KERNEL'
    1384 |                 USER_TO_KERNEL(struct csi_sam_format);
         |                 ^~~~~~~~~~~~~~
   In function 'csis_s_fmt',
       inlined from 'csis_priv_ioctl' at drivers/staging/media/imx/imx8-mipi-csi2-sam.c:1385:9:
   drivers/staging/media/imx/imx8-mipi-csi2-sam.c:1319:34: warning: dangling pointer to 'tmp' may be used [-Wdangling-pointer=]
    1319 |         state->format.width = fmt->width;
         |                               ~~~^~~~~~~
   drivers/staging/media/imx/imx8-mipi-csi2-sam.c: In function 'csis_priv_ioctl':
   drivers/staging/media/imx/imx8-mipi-csi2-sam.c:1347:22: note: 'tmp' declared here
    1347 |                 TYPE tmp; \
         |                      ^~~
   drivers/staging/media/imx/imx8-mipi-csi2-sam.c:1384:17: note: in expansion of macro 'USER_TO_KERNEL'
    1384 |                 USER_TO_KERNEL(struct csi_sam_format);
         |                 ^~~~~~~~~~~~~~
   In function 'csis_s_fmt',
       inlined from 'csis_priv_ioctl' at drivers/staging/media/imx/imx8-mipi-csi2-sam.c:1385:9:
   drivers/staging/media/imx/imx8-mipi-csi2-sam.c:1320:35: warning: dangling pointer to 'tmp' may be used [-Wdangling-pointer=]
    1320 |         state->format.height = fmt->height;
         |                                ~~~^~~~~~~~
   drivers/staging/media/imx/imx8-mipi-csi2-sam.c: In function 'csis_priv_ioctl':
   drivers/staging/media/imx/imx8-mipi-csi2-sam.c:1347:22: note: 'tmp' declared here
    1347 |                 TYPE tmp; \
         |                      ^~~
   drivers/staging/media/imx/imx8-mipi-csi2-sam.c:1384:17: note: in expansion of macro 'USER_TO_KERNEL'
    1384 |                 USER_TO_KERNEL(struct csi_sam_format);
         |                 ^~~~~~~~~~~~~~


vim +/len +1547 drivers/staging/media/imx/imx8-mipi-csi2-sam.c

346ee386e32f16 Guoniu.zhou 2019-10-25  1534  
06b8d851396b68 Guoniu.zhou 2020-08-21  1535  /*
06b8d851396b68 Guoniu.zhou 2020-08-21  1536   * IMX8MN platform data
06b8d851396b68 Guoniu.zhou 2020-08-21  1537   */
06b8d851396b68 Guoniu.zhou 2020-08-21  1538  static int mipi_csis_imx8mn_parse_resets(struct csi_state *state)
346ee386e32f16 Guoniu.zhou 2019-10-25  1539  {
346ee386e32f16 Guoniu.zhou 2019-10-25  1540  	int ret;
346ee386e32f16 Guoniu.zhou 2019-10-25  1541  	struct device *dev = state->dev;
346ee386e32f16 Guoniu.zhou 2019-10-25  1542  	struct device_node *np = dev->of_node;
346ee386e32f16 Guoniu.zhou 2019-10-25  1543  	struct device_node *parent, *child;
346ee386e32f16 Guoniu.zhou 2019-10-25  1544  	struct of_phandle_args args;
346ee386e32f16 Guoniu.zhou 2019-10-25  1545  	struct reset_control *rstc;
346ee386e32f16 Guoniu.zhou 2019-10-25  1546  	const char *compat;
346ee386e32f16 Guoniu.zhou 2019-10-25 @1547  	uint32_t len, rstc_num = 0;
346ee386e32f16 Guoniu.zhou 2019-10-25  1548  
346ee386e32f16 Guoniu.zhou 2019-10-25  1549  	ret = of_parse_phandle_with_args(np, "resets", "#reset-cells",
346ee386e32f16 Guoniu.zhou 2019-10-25  1550  					 0, &args);
346ee386e32f16 Guoniu.zhou 2019-10-25  1551  	if (ret)
346ee386e32f16 Guoniu.zhou 2019-10-25  1552  		return ret;
346ee386e32f16 Guoniu.zhou 2019-10-25  1553  
346ee386e32f16 Guoniu.zhou 2019-10-25  1554  	parent = args.np;
346ee386e32f16 Guoniu.zhou 2019-10-25  1555  	for_each_child_of_node(parent, child) {
346ee386e32f16 Guoniu.zhou 2019-10-25  1556  		compat = of_get_property(child, "compatible", NULL);
346ee386e32f16 Guoniu.zhou 2019-10-25  1557  		if (!compat)
346ee386e32f16 Guoniu.zhou 2019-10-25  1558  			continue;
346ee386e32f16 Guoniu.zhou 2019-10-25  1559  
346ee386e32f16 Guoniu.zhou 2019-10-25  1560  		rstc = of_reset_control_array_get(child, false, false, true);
346ee386e32f16 Guoniu.zhou 2019-10-25  1561  		if (IS_ERR(rstc))
346ee386e32f16 Guoniu.zhou 2019-10-25  1562  			continue;
346ee386e32f16 Guoniu.zhou 2019-10-25  1563  
346ee386e32f16 Guoniu.zhou 2019-10-25  1564  		len = strlen(compat);
346ee386e32f16 Guoniu.zhou 2019-10-25  1565  		if (!of_compat_cmp("csi,soft-resetn", compat, len)) {
346ee386e32f16 Guoniu.zhou 2019-10-25  1566  			state->soft_resetn = rstc;
346ee386e32f16 Guoniu.zhou 2019-10-25  1567  			rstc_num++;
346ee386e32f16 Guoniu.zhou 2019-10-25  1568  		} else if (!of_compat_cmp("csi,clk-enable", compat, len)) {
346ee386e32f16 Guoniu.zhou 2019-10-25  1569  			state->clk_enable = rstc;
346ee386e32f16 Guoniu.zhou 2019-10-25  1570  			rstc_num++;
346ee386e32f16 Guoniu.zhou 2019-10-25  1571  		} else if (!of_compat_cmp("csi,mipi-reset", compat, len)) {
346ee386e32f16 Guoniu.zhou 2019-10-25  1572  			state->mipi_reset = rstc;
346ee386e32f16 Guoniu.zhou 2019-10-25  1573  			rstc_num++;
346ee386e32f16 Guoniu.zhou 2019-10-25  1574  		} else {
346ee386e32f16 Guoniu.zhou 2019-10-25  1575  			dev_warn(dev, "invalid csis reset node: %s\n", compat);
346ee386e32f16 Guoniu.zhou 2019-10-25  1576  		}
346ee386e32f16 Guoniu.zhou 2019-10-25  1577  	}
346ee386e32f16 Guoniu.zhou 2019-10-25  1578  
346ee386e32f16 Guoniu.zhou 2019-10-25  1579  	if (!rstc_num) {
346ee386e32f16 Guoniu.zhou 2019-10-25  1580  		dev_err(dev, "no invalid reset control exists\n");
346ee386e32f16 Guoniu.zhou 2019-10-25  1581  		return -EINVAL;
346ee386e32f16 Guoniu.zhou 2019-10-25  1582  	}
346ee386e32f16 Guoniu.zhou 2019-10-25  1583  	of_node_put(parent);
346ee386e32f16 Guoniu.zhou 2019-10-25  1584  
346ee386e32f16 Guoniu.zhou 2019-10-25  1585  	return 0;
346ee386e32f16 Guoniu.zhou 2019-10-25  1586  }
346ee386e32f16 Guoniu.zhou 2019-10-25  1587  

:::::: The code at line 1547 was first introduced by commit
:::::: 346ee386e32f16b271d03d6e8337c2246b4739e3 staging: media: imx: add V4L2 subdev driver for MIPI CSI2 of Samsung

:::::: TO: Guoniu.zhou <guoniu.zhou@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
