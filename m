Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C181CAA4
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Sep 2024 03:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727578994; cv=none; b=gNHCmTNli6jngHrdqf8L/Bxy3MO8RsI77G94lZEtxZhAi6pHBEo14r+basrXVEsuBWf0L07J5NFTMmtDpAL/+mxb9W8II8oPVUSvdeqd9UC4GoHZtsC9VeZUr9XWBrGIbNus7b40eax62X9QWi0rdvzlYn5KsbgOwIzRBw0ny2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727578994; c=relaxed/simple;
	bh=vuiHImBSpzW8QtPGaow/Gv8UyFnV+yobx5XLTkESySM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=InDZEWSJJABnI8SHcdjqLb+lLp9hmapw03KO76I1uUetntCj10rx2obVpY8FxUPB5fhHvBzaAPZJ+QbCLAve9KiNQHnF3sSb/BHkAFngIwUbJTnF6Xuez/7Cev7jvZgA0PNj2I3I+ruSjShrykN4YOoefUOJlz0llwl3/N+sOr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dhHdW6O2; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dhHdW6O2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727578992; x=1759114992;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vuiHImBSpzW8QtPGaow/Gv8UyFnV+yobx5XLTkESySM=;
  b=dhHdW6O2phfru4GJWirPU8Iym0D3i7D3gxPG3zS5epbX6citPZE0Y/aX
   EcKNLNABCy/Bvr4XcfgE9R9An83aASCSooFDBtjyYmgLJpwc109apufZz
   cqFajnbcz9SY5WE4HIAVIaMSXSk+LF2SdziVt0LADIlfxMrQIqF+LJK60
   XSR8j2Yo8ljS6G5BkTpjKI4XnWlfoOfT0pmVQpYWyS/PfxTjOMZgpu0dt
   6afcPmTFt2j5m+07iUvp/cZ8D4TptcHzpdpR6fuyl2lAuJzK6gdLQgN4F
   1DFzu6dRYeUNfbQx8ns8/FthwqKBf9t5twWsVpHhyC4oqdlNees1VBIPP
   A==;
X-CSE-ConnectionGUID: 3o/oHFb3T7KmeeFt/iZrAw==
X-CSE-MsgGUID: 1iG+H6EPTg6HiaPNWNW2ag==
X-IronPort-AV: E=McAfee;i="6700,10204,11209"; a="44209285"
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; 
   d="scan'208";a="44209285"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2024 20:03:11 -0700
X-CSE-ConnectionGUID: PCCni+MVQL6znyaJ6NfTRg==
X-CSE-MsgGUID: uv3O8G3wTD21vC6CV5bwrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; 
   d="scan'208";a="73224404"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 28 Sep 2024 20:03:10 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sukDD-000Nqx-2J;
	Sun, 29 Sep 2024 03:03:07 +0000
Date: Sun, 29 Sep 2024 11:02:10 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.0.x-imx 285/16788]
 drivers/staging/media/imx/imx8-mipi-csi2-sam.c:1556:18: warning: variable
 'len' set but not used
Message-ID: <202409291044.Qax9pSyp-lkp@intel.com>
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
commit: a389a8f36a334fe2d2bf9896c55d415fa0e6a719 [285/16788] LF-5810-03: media: csi2-sam: Kconfig: cleanup VIDEO_V4L2 due to community change
config: xtensa-allyesconfig (https://download.01.org/0day-ci/archive/20240929/202409291044.Qax9pSyp-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240929/202409291044.Qax9pSyp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409291044.Qax9pSyp-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/staging/media/imx/imx8-mipi-csi2-sam.c:428:37: error: field 'asd' has incomplete type
     428 |         struct v4l2_async_subdev    asd;
         |                                     ^~~
   drivers/staging/media/imx/imx8-mipi-csi2-sam.c: In function 'csis_get_remote_sensor_pad':
   drivers/staging/media/imx/imx8-mipi-csi2-sam.c:594:46: error: implicit declaration of function 'media_entity_remote_pad'; did you mean 'media_entity_remove_links'? [-Wimplicit-function-declaration]
     594 |                                 source_pad = media_entity_remote_pad(sink_pad);
         |                                              ^~~~~~~~~~~~~~~~~~~~~~~
         |                                              media_entity_remove_links
   drivers/staging/media/imx/imx8-mipi-csi2-sam.c:594:44: error: assignment to 'struct media_pad *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     594 |                                 source_pad = media_entity_remote_pad(sink_pad);
         |                                            ^
   drivers/staging/media/imx/imx8-mipi-csi2-sam.c: In function 'mipi_csis_imx8mn_parse_resets':
>> drivers/staging/media/imx/imx8-mipi-csi2-sam.c:1556:18: warning: variable 'len' set but not used [-Wunused-but-set-variable]
    1556 |         uint32_t len, rstc_num = 0;
         |                  ^~~
   drivers/staging/media/imx/imx8-mipi-csi2-sam.c: In function 'mipi_csis_probe':
>> drivers/staging/media/imx/imx8-mipi-csi2-sam.c:1900:29: warning: variable 'mipi_sd' set but not used [-Wunused-but-set-variable]
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


vim +/len +1556 drivers/staging/media/imx/imx8-mipi-csi2-sam.c

62a5cdad8dc357 Guoniu.zhou 2019-10-25  1543  
b5f9e0b78a7186 Guoniu.zhou 2020-08-21  1544  /*
b5f9e0b78a7186 Guoniu.zhou 2020-08-21  1545   * IMX8MN platform data
b5f9e0b78a7186 Guoniu.zhou 2020-08-21  1546   */
b5f9e0b78a7186 Guoniu.zhou 2020-08-21  1547  static int mipi_csis_imx8mn_parse_resets(struct csi_state *state)
62a5cdad8dc357 Guoniu.zhou 2019-10-25  1548  {
62a5cdad8dc357 Guoniu.zhou 2019-10-25  1549  	int ret;
62a5cdad8dc357 Guoniu.zhou 2019-10-25  1550  	struct device *dev = state->dev;
62a5cdad8dc357 Guoniu.zhou 2019-10-25  1551  	struct device_node *np = dev->of_node;
62a5cdad8dc357 Guoniu.zhou 2019-10-25  1552  	struct device_node *parent, *child;
62a5cdad8dc357 Guoniu.zhou 2019-10-25  1553  	struct of_phandle_args args;
62a5cdad8dc357 Guoniu.zhou 2019-10-25  1554  	struct reset_control *rstc;
62a5cdad8dc357 Guoniu.zhou 2019-10-25  1555  	const char *compat;
62a5cdad8dc357 Guoniu.zhou 2019-10-25 @1556  	uint32_t len, rstc_num = 0;
62a5cdad8dc357 Guoniu.zhou 2019-10-25  1557  
62a5cdad8dc357 Guoniu.zhou 2019-10-25  1558  	ret = of_parse_phandle_with_args(np, "resets", "#reset-cells",
62a5cdad8dc357 Guoniu.zhou 2019-10-25  1559  					 0, &args);
62a5cdad8dc357 Guoniu.zhou 2019-10-25  1560  	if (ret)
62a5cdad8dc357 Guoniu.zhou 2019-10-25  1561  		return ret;
62a5cdad8dc357 Guoniu.zhou 2019-10-25  1562  
62a5cdad8dc357 Guoniu.zhou 2019-10-25  1563  	parent = args.np;
62a5cdad8dc357 Guoniu.zhou 2019-10-25  1564  	for_each_child_of_node(parent, child) {
62a5cdad8dc357 Guoniu.zhou 2019-10-25  1565  		compat = of_get_property(child, "compatible", NULL);
62a5cdad8dc357 Guoniu.zhou 2019-10-25  1566  		if (!compat)
62a5cdad8dc357 Guoniu.zhou 2019-10-25  1567  			continue;
62a5cdad8dc357 Guoniu.zhou 2019-10-25  1568  
62a5cdad8dc357 Guoniu.zhou 2019-10-25  1569  		rstc = of_reset_control_array_get(child, false, false, true);
62a5cdad8dc357 Guoniu.zhou 2019-10-25  1570  		if (IS_ERR(rstc))
62a5cdad8dc357 Guoniu.zhou 2019-10-25  1571  			continue;
62a5cdad8dc357 Guoniu.zhou 2019-10-25  1572  
62a5cdad8dc357 Guoniu.zhou 2019-10-25  1573  		len = strlen(compat);
62a5cdad8dc357 Guoniu.zhou 2019-10-25  1574  		if (!of_compat_cmp("csi,soft-resetn", compat, len)) {
62a5cdad8dc357 Guoniu.zhou 2019-10-25  1575  			state->soft_resetn = rstc;
62a5cdad8dc357 Guoniu.zhou 2019-10-25  1576  			rstc_num++;
62a5cdad8dc357 Guoniu.zhou 2019-10-25  1577  		} else if (!of_compat_cmp("csi,clk-enable", compat, len)) {
62a5cdad8dc357 Guoniu.zhou 2019-10-25  1578  			state->clk_enable = rstc;
62a5cdad8dc357 Guoniu.zhou 2019-10-25  1579  			rstc_num++;
62a5cdad8dc357 Guoniu.zhou 2019-10-25  1580  		} else if (!of_compat_cmp("csi,mipi-reset", compat, len)) {
62a5cdad8dc357 Guoniu.zhou 2019-10-25  1581  			state->mipi_reset = rstc;
62a5cdad8dc357 Guoniu.zhou 2019-10-25  1582  			rstc_num++;
62a5cdad8dc357 Guoniu.zhou 2019-10-25  1583  		} else {
62a5cdad8dc357 Guoniu.zhou 2019-10-25  1584  			dev_warn(dev, "invalid csis reset node: %s\n", compat);
62a5cdad8dc357 Guoniu.zhou 2019-10-25  1585  		}
62a5cdad8dc357 Guoniu.zhou 2019-10-25  1586  	}
62a5cdad8dc357 Guoniu.zhou 2019-10-25  1587  
62a5cdad8dc357 Guoniu.zhou 2019-10-25  1588  	if (!rstc_num) {
62a5cdad8dc357 Guoniu.zhou 2019-10-25  1589  		dev_err(dev, "no invalid reset control exists\n");
62a5cdad8dc357 Guoniu.zhou 2019-10-25  1590  		return -EINVAL;
62a5cdad8dc357 Guoniu.zhou 2019-10-25  1591  	}
62a5cdad8dc357 Guoniu.zhou 2019-10-25  1592  	of_node_put(parent);
62a5cdad8dc357 Guoniu.zhou 2019-10-25  1593  
62a5cdad8dc357 Guoniu.zhou 2019-10-25  1594  	return 0;
62a5cdad8dc357 Guoniu.zhou 2019-10-25  1595  }
62a5cdad8dc357 Guoniu.zhou 2019-10-25  1596  

:::::: The code at line 1556 was first introduced by commit
:::::: 62a5cdad8dc357a24f464407972456eff9290266 staging: media: imx: add V4L2 subdev driver for MIPI CSI2 of Samsung

:::::: TO: Guoniu.zhou <guoniu.zhou@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
