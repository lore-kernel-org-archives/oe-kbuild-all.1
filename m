Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92DF818E24
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Jan 2024 23:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N6XVlnzm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705100976; x=1736636976;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FPTSZFbHUyBL02e1yJeb5wehoaaD2JviygUWmKqcL5M=;
  b=N6XVlnzmzCYoc48GljZiWC4xT/9VWW96HmyPaIIxqXPXX8Z1T8cEKnUx
   9nuE/dO9/XIdPYMDLCIyM9yS6Pm+bTNEPFJaDOirke440PY4o4JQegUVN
   g2GtBd/O+kdzxX3u/lUZhSvmtP87BudP8XKp5tq+9623z7L38ZLFkK8uI
   Zk6hXJ+ZniInj7l7QZgCpNiSfmmymhY0U1JtXr4VL1xvAzpkls56+lxfg
   kKUZShO/JRmjYuxWiN7QH4VQ5nReXkOw0meKr7OWadsMixRQIgM9Scpjn
   /yf0LG0IPBKGLV8AfAzpZbV1MBr7uyPJSn+n+pOyGtRswOgIijs/74/rN
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="389755884"
X-IronPort-AV: E=Sophos;i="6.04,191,1695711600"; 
   d="scan'208";a="389755884"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2024 15:09:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="906448520"
X-IronPort-AV: E=Sophos;i="6.04,191,1695711600"; 
   d="scan'208";a="906448520"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 12 Jan 2024 15:09:34 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rOQea-0009tA-2M;
	Fri, 12 Jan 2024 23:09:32 +0000
Date: Sat, 13 Jan 2024 07:09:31 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.2.x-imx 12556/17888]
 drivers/staging/media/imx/imx8-mipi-csi2.c:1024:13: warning: stack frame
 size (1248) exceeds limit (1024) in 'mipi_csi2_hw_config'
Message-ID: <202401130753.aaoUtsa1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.1-2.2.x-imx
head:   32a344619c750cdcbe31bed754adc1b30d362e45
commit: 5e6e2115d8a8fb952c20bd0a27a627aa7562f095 [12556/17888] LF-9127-2: media: csi: Support suspend/resume when camera is running
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20240113/202401130753.aaoUtsa1-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240113/202401130753.aaoUtsa1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401130753.aaoUtsa1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/staging/media/imx/imx8-mipi-csi2.c:1131:46: warning: unused variable 'mipi_csi2_sd_internal_ops' [-Wunused-const-variable]
    1131 | static const struct v4l2_subdev_internal_ops mipi_csi2_sd_internal_ops = {
         |                                              ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/media/imx/imx8-mipi-csi2.c:1024:13: warning: stack frame size (1248) exceeds limit (1024) in 'mipi_csi2_hw_config' [-Wframe-larger-than]
    1024 | static void mipi_csi2_hw_config(struct mxc_mipi_csi2_dev *csi2dev)
         |             ^
   2 warnings generated.


vim +/mipi_csi2_hw_config +1024 drivers/staging/media/imx/imx8-mipi-csi2.c

  1023	
> 1024	static void mipi_csi2_hw_config(struct mxc_mipi_csi2_dev *csi2dev)
  1025	{
  1026		mxc_csi2_get_sensor_fmt(csi2dev);
  1027		mxc_mipi_csi2_hc_config(csi2dev);
  1028		mxc_mipi_csi2_reset(csi2dev);
  1029		mxc_mipi_csi2_csr_config(csi2dev);
  1030		mxc_mipi_csi2_enable(csi2dev);
  1031		mxc_mipi_csi2_reg_dump(csi2dev);
  1032	}
  1033	
  1034	static int mipi_csi2_s_stream(struct v4l2_subdev *sd, int enable)
  1035	{
  1036		struct mxc_mipi_csi2_dev *csi2dev = sd_to_mxc_mipi_csi2_dev(sd);
  1037		struct device *dev = &csi2dev->pdev->dev;
  1038		int ret = 0;
  1039	
  1040		dev_dbg(&csi2dev->pdev->dev, "%s: %d, csi2dev: 0x%x\n",
  1041			__func__, enable, csi2dev->flags);
  1042	
  1043		if (enable) {
  1044			pm_runtime_get_sync(dev);
  1045			if (!csi2dev->running++) {
  1046				if (!csi2dev->runtime_suspend)
  1047					mipi_csi2_hw_config(csi2dev);
  1048			}
  1049		} else {
  1050			if (!--csi2dev->running) {
  1051				if (!csi2dev->runtime_suspend)
  1052					mxc_mipi_csi2_disable(csi2dev);
  1053			}
  1054			pm_runtime_put(dev);
  1055		}
  1056	
  1057		return ret;
  1058	}
  1059	
  1060	static int mipi_csi2_enum_framesizes(struct v4l2_subdev *sd,
  1061					     struct v4l2_subdev_state *sd_state,
  1062					     struct v4l2_subdev_frame_size_enum *fse)
  1063	{
  1064		struct mxc_mipi_csi2_dev *csi2dev = sd_to_mxc_mipi_csi2_dev(sd);
  1065		struct v4l2_subdev *sen_sd;
  1066	
  1067		sen_sd = mxc_get_remote_subdev(csi2dev, __func__);
  1068		if (!sen_sd)
  1069			return -EINVAL;
  1070	
  1071		return v4l2_subdev_call(sen_sd, pad, enum_frame_size, NULL, fse);
  1072	}
  1073	
  1074	static int mipi_csi2_enum_frame_interval(struct v4l2_subdev *sd,
  1075						 struct v4l2_subdev_state *sd_state,
  1076						 struct v4l2_subdev_frame_interval_enum *fie)
  1077	{
  1078		struct mxc_mipi_csi2_dev *csi2dev = sd_to_mxc_mipi_csi2_dev(sd);
  1079		struct v4l2_subdev *sen_sd;
  1080	
  1081		sen_sd = mxc_get_remote_subdev(csi2dev, __func__);
  1082		if (!sen_sd)
  1083			return -EINVAL;
  1084	
  1085		return v4l2_subdev_call(sen_sd, pad, enum_frame_interval, NULL, fie);
  1086	}
  1087	
  1088	static int mipi_csi2_get_fmt(struct v4l2_subdev *sd,
  1089				     struct v4l2_subdev_state *sd_state,
  1090				     struct v4l2_subdev_format *fmt)
  1091	{
  1092		struct mxc_mipi_csi2_dev *csi2dev = sd_to_mxc_mipi_csi2_dev(sd);
  1093		struct v4l2_mbus_framefmt *mf = &fmt->format;
  1094	
  1095		mxc_csi2_get_sensor_fmt(csi2dev);
  1096	
  1097		memcpy(mf, &csi2dev->format, sizeof(struct v4l2_mbus_framefmt));
  1098		/* Source/Sink pads crop rectangle size */
  1099	
  1100		return 0;
  1101	}
  1102	
  1103	static int mipi_csi2_set_fmt(struct v4l2_subdev *sd,
  1104				     struct v4l2_subdev_state *sd_state,
  1105				     struct v4l2_subdev_format *fmt)
  1106	{
  1107		struct mxc_mipi_csi2_dev *csi2dev = sd_to_mxc_mipi_csi2_dev(sd);
  1108		struct v4l2_subdev *sen_sd;
  1109		struct media_pad *source_pad;
  1110		int ret;
  1111	
  1112		/* Get remote source pad */
  1113		source_pad = mxc_csi2_get_remote_sensor_pad(csi2dev);
  1114		if (!source_pad) {
  1115			v4l2_err(&csi2dev->sd, "%s, No remote pad found!\n", __func__);
  1116			return -EINVAL;
  1117		}
  1118	
  1119		sen_sd = mxc_get_remote_subdev(csi2dev, __func__);
  1120		if (!sd)
  1121			return -EINVAL;
  1122	
  1123		fmt->pad = source_pad->index;
  1124		ret = v4l2_subdev_call(sen_sd, pad, set_fmt, NULL, fmt);
  1125		if (ret < 0 && ret != -ENOIOCTLCMD)
  1126			return ret;
  1127	
  1128		return 0;
  1129	}
  1130	
> 1131	static const struct v4l2_subdev_internal_ops mipi_csi2_sd_internal_ops = {
  1132		.open = mipi_csi2_open,
  1133	};
  1134	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
