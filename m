Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B6FB1CCEFA
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Oct 2024 22:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729636753; cv=none; b=FcNGLJa9zoVnvizst0gNNw+CRAthNtInSpJwR2YYlWOPt8nJu7+B4yAOnEz4nEtsdcUepOysH7rSzKExESPKwN8XAAIG4rWMSX5zY1DC8efuQX2rtyilA9voViyWHBUnBzVB8oBxq/OUu0dCresD4ecp9YjhOUyETUbRjOFSIYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729636753; c=relaxed/simple;
	bh=8kW1oko5Mh+4cOx8ur/o3PLJKHqrwhWhhC3abnlYGxc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Vk5mMiS7zABQRStLwdv4XQljaVK/1pjAs0I4Okp5yfJqagytmvdl3RbdY2VtsgIS40cg2JD1kMc1LKHJR7GLTID8VQsnymsPgqLmDTI4HKCMFTNX77Dkr3T8z/E2mKoicbw2Rd60RjEd9DTuGWIEsadInL1ABuDVHxxisyp3cz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FMQMoZxd; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FMQMoZxd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729636750; x=1761172750;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8kW1oko5Mh+4cOx8ur/o3PLJKHqrwhWhhC3abnlYGxc=;
  b=FMQMoZxdsq1MNyZLklg91lJLiMt/Crd3BVYE7dLdN8pdhl22Q1l6DCwa
   7D0xiyUmm2uM9JYFf59cbPbgvSCuPe+ewZAOCryPhozvPzESBR+GpEoCF
   PIvQ2/90FWe7E/Ic4Z2gGMn90NjgtvYRzej+l54DLvEAX+EavF66j1lET
   PCriGs7DJRL9NXT47mBZpVYocBey2VRpNO3/ZcpLKmKr+M2Fz80yA72hK
   QGaYKM3yHK+3HpVSZXWV1PLCv1bEAz/jHAwPdikex3lrYGtl+YECipwVS
   Qp+Jr7qE0WvuM6po15QcdYz1JkhR8KMTlqllUgkClQRFilR+8A7gDqdDY
   A==;
X-CSE-ConnectionGUID: WYgYlIoPRNmwvf/+PaGkWA==
X-CSE-MsgGUID: eJTu/TiUQaynMN8faOhg1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11233"; a="33125611"
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; 
   d="scan'208";a="33125611"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2024 15:39:10 -0700
X-CSE-ConnectionGUID: F0OreF2KQ9y3FDOuQsWFwQ==
X-CSE-MsgGUID: tyZFj8TPTU+piLYgLN63Dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; 
   d="scan'208";a="79953267"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 22 Oct 2024 15:39:09 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3NWs-000UBW-1h;
	Tue, 22 Oct 2024 22:39:06 +0000
Date: Wed, 23 Oct 2024 06:38:40 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.1.x-imx 285/17820]
 drivers/staging/media/imx/imx8-mipi-csi2-sam.c:1556:18: warning: variable
 'len' set but not used
Message-ID: <202410230637.y26hvHqU-lkp@intel.com>
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

tree:   https://github.com/Freescale/linux-fslc 6.6-2.1.x-imx
head:   47d927c130da97d140d1455103e3cacecef94807
commit: a389a8f36a334fe2d2bf9896c55d415fa0e6a719 [285/17820] LF-5810-03: media: csi2-sam: Kconfig: cleanup VIDEO_V4L2 due to community change
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20241023/202410230637.y26hvHqU-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241023/202410230637.y26hvHqU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410230637.y26hvHqU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/staging/media/imx/imx8-mipi-csi2-sam.c:428:37: error: field 'asd' has incomplete type
     428 |         struct v4l2_async_subdev    asd;
         |                                     ^~~
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
   cc1: some warnings being treated as errors


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
