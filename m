Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8D219BB8
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Aug 2023 19:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693510267; x=1725046267;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FWeV15pkTM9+Ocsi4f4lUEU1BxLpZa6I6WBpNkwOeT4=;
  b=gifqTlccOtVZQxMHElJRmYuiDgXYYaQk2GFDYi9xV7kWXpaP/Vf3WHAl
   Uu0PZRgbR/GgBAy8e9f+hPinWURCyYneNFfdZaSuEYqSZGq5P9jpW+fwc
   LxswuMa8jhUyqupqMjph7+fIiu3JKUBp6ZDKWrIP7tiFFtFkwSPf7dKXs
   BnWcDu9E4SUhxXsc7Z7VX8t+yVvmpvYhMnZK7iHdoD2fwEBKO4LErKRut
   u3zxcO6WnV095QiFLWe/axZjGO1o4GJJWhfsRXLZjQqp3kkaFSfzLgOnk
   JS0kNoGQ/jHICnqsRUutRZsQQtW+ILNoT9TuZQvEt6fXPcxeBS5YgsDmD
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="378777646"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; 
   d="scan'208";a="378777646"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 12:31:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="809748156"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; 
   d="scan'208";a="809748156"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 31 Aug 2023 12:31:03 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbnNd-0000U5-2y;
	Thu, 31 Aug 2023 19:31:01 +0000
Date: Fri, 1 Sep 2023 03:30:13 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/639 6076/24603]
 drivers/media/platform/mxc/capture/mxc_mipi_csi.c:1266:12: warning:
 'mipi_csis_runtime_resume' defined but not used
Message-ID: <202309010328.r6ZWrpy0-lkp@intel.com>
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
commit: b0519c4b9531e65e71b3ff5db18553d6ad840099 [6076/24603] Merge remote-tracking branch 'origin/capture/mxc' into capture/next
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230901/202309010328.r6ZWrpy0-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230901/202309010328.r6ZWrpy0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309010328.r6ZWrpy0-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/platform/mxc/capture/mxc_mipi_csi.c: In function 'mipi_csis_probe':
   drivers/media/platform/mxc/capture/mxc_mipi_csi.c:1075:29: warning: variable 'mipi_sd' set but not used [-Wunused-but-set-variable]
    1075 |         struct v4l2_subdev *mipi_sd;
         |                             ^~~~~~~
   drivers/media/platform/mxc/capture/mxc_mipi_csi.c: At top level:
>> drivers/media/platform/mxc/capture/mxc_mipi_csi.c:1266:12: warning: 'mipi_csis_runtime_resume' defined but not used [-Wunused-function]
    1266 | static int mipi_csis_runtime_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/mxc/capture/mxc_mipi_csi.c:1261:12: warning: 'mipi_csis_runtime_suspend' defined but not used [-Wunused-function]
    1261 | static int mipi_csis_runtime_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +/mipi_csis_runtime_resume +1266 drivers/media/platform/mxc/capture/mxc_mipi_csi.c

6205720ceacacc Robby Cai 2019-09-27  1071  
6205720ceacacc Robby Cai 2019-09-27  1072  static int mipi_csis_probe(struct platform_device *pdev)
6205720ceacacc Robby Cai 2019-09-27  1073  {
6205720ceacacc Robby Cai 2019-09-27  1074  	struct device *dev = &pdev->dev;
6205720ceacacc Robby Cai 2019-09-27 @1075  	struct v4l2_subdev *mipi_sd;
6205720ceacacc Robby Cai 2019-09-27  1076  	struct resource *mem_res;
6205720ceacacc Robby Cai 2019-09-27  1077  	struct csi_state *state;
6205720ceacacc Robby Cai 2019-09-27  1078  	const struct of_device_id *of_id;
6205720ceacacc Robby Cai 2019-09-27  1079  	mipi_csis_phy_reset_t phy_reset_fn;
6205720ceacacc Robby Cai 2019-09-27  1080  	int ret = -ENOMEM;
6205720ceacacc Robby Cai 2019-09-27  1081  
6205720ceacacc Robby Cai 2019-09-27  1082  	state = devm_kzalloc(dev, sizeof(*state), GFP_KERNEL);
6205720ceacacc Robby Cai 2019-09-27  1083  	if (!state)
6205720ceacacc Robby Cai 2019-09-27  1084  		return -ENOMEM;
6205720ceacacc Robby Cai 2019-09-27  1085  
6205720ceacacc Robby Cai 2019-09-27  1086  	mutex_init(&state->lock);
6205720ceacacc Robby Cai 2019-09-27  1087  	spin_lock_init(&state->slock);
6205720ceacacc Robby Cai 2019-09-27  1088  
6205720ceacacc Robby Cai 2019-09-27  1089  	state->pdev = pdev;
6205720ceacacc Robby Cai 2019-09-27  1090  	mipi_sd = &state->mipi_sd;
6205720ceacacc Robby Cai 2019-09-27  1091  	state->dev = dev;
6205720ceacacc Robby Cai 2019-09-27  1092  
6205720ceacacc Robby Cai 2019-09-27  1093  	ret = mipi_csis_parse_dt(pdev, state);
6205720ceacacc Robby Cai 2019-09-27  1094  	if (ret < 0)
6205720ceacacc Robby Cai 2019-09-27  1095  		return ret;
6205720ceacacc Robby Cai 2019-09-27  1096  
6205720ceacacc Robby Cai 2019-09-27  1097  	if (state->num_lanes == 0 || state->num_lanes > state->max_num_lanes) {
6205720ceacacc Robby Cai 2019-09-27  1098  		dev_err(dev, "Unsupported number of data lanes: %d (max. %d)\n",
6205720ceacacc Robby Cai 2019-09-27  1099  			state->num_lanes, state->max_num_lanes);
6205720ceacacc Robby Cai 2019-09-27  1100  		return -EINVAL;
6205720ceacacc Robby Cai 2019-09-27  1101  	}
6205720ceacacc Robby Cai 2019-09-27  1102  
6205720ceacacc Robby Cai 2019-09-27  1103  	mipi_csis_phy_init(state);
6205720ceacacc Robby Cai 2019-09-27  1104  	of_id = of_match_node(mipi_csis_of_match, dev->of_node);
6205720ceacacc Robby Cai 2019-09-27  1105  	if (!of_id || !of_id->data)
6205720ceacacc Robby Cai 2019-09-27  1106  		return -EINVAL;
6205720ceacacc Robby Cai 2019-09-27  1107  
6205720ceacacc Robby Cai 2019-09-27  1108  	phy_reset_fn = of_id->data;
6205720ceacacc Robby Cai 2019-09-27  1109  
6205720ceacacc Robby Cai 2019-09-27  1110  	mem_res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
6205720ceacacc Robby Cai 2019-09-27  1111  	state->regs = devm_ioremap_resource(dev, mem_res);
6205720ceacacc Robby Cai 2019-09-27  1112  	if (IS_ERR(state->regs))
6205720ceacacc Robby Cai 2019-09-27  1113  		return PTR_ERR(state->regs);
6205720ceacacc Robby Cai 2019-09-27  1114  
6205720ceacacc Robby Cai 2019-09-27  1115  	state->irq = platform_get_irq(pdev, 0);
6205720ceacacc Robby Cai 2019-09-27  1116  	if (state->irq < 0) {
6205720ceacacc Robby Cai 2019-09-27  1117  		dev_err(dev, "Failed to get irq\n");
6205720ceacacc Robby Cai 2019-09-27  1118  		return state->irq;
6205720ceacacc Robby Cai 2019-09-27  1119  	}
6205720ceacacc Robby Cai 2019-09-27  1120  
6205720ceacacc Robby Cai 2019-09-27  1121  	ret = mipi_csis_clk_get(state);
6205720ceacacc Robby Cai 2019-09-27  1122  	if (ret < 0)
6205720ceacacc Robby Cai 2019-09-27  1123  		return ret;
6205720ceacacc Robby Cai 2019-09-27  1124  
6205720ceacacc Robby Cai 2019-09-27  1125  	mipi_csis_clk_enable(state);
6205720ceacacc Robby Cai 2019-09-27  1126  
6205720ceacacc Robby Cai 2019-09-27  1127  	phy_reset_fn(state);
6205720ceacacc Robby Cai 2019-09-27  1128  
6205720ceacacc Robby Cai 2019-09-27  1129  	ret = devm_request_irq(dev, state->irq, mipi_csis_irq_handler,
6205720ceacacc Robby Cai 2019-09-27  1130  			       0, dev_name(dev), state);
6205720ceacacc Robby Cai 2019-09-27  1131  	if (ret) {
6205720ceacacc Robby Cai 2019-09-27  1132  		dev_err(dev, "Interrupt request failed\n");
6205720ceacacc Robby Cai 2019-09-27  1133  		goto e_clkdis;
6205720ceacacc Robby Cai 2019-09-27  1134  	}
6205720ceacacc Robby Cai 2019-09-27  1135  
6205720ceacacc Robby Cai 2019-09-27  1136  	/* First register a v4l2 device */
6205720ceacacc Robby Cai 2019-09-27  1137  	ret = v4l2_device_register(dev, &state->v4l2_dev);
6205720ceacacc Robby Cai 2019-09-27  1138  	if (ret) {
6205720ceacacc Robby Cai 2019-09-27  1139  		v4l2_err(dev->driver,
6205720ceacacc Robby Cai 2019-09-27  1140  			"Unable to register v4l2 device.\n");
6205720ceacacc Robby Cai 2019-09-27  1141  		goto e_clkdis;
6205720ceacacc Robby Cai 2019-09-27  1142  	}
6205720ceacacc Robby Cai 2019-09-27  1143  	v4l2_info(&state->v4l2_dev, "mipi csi v4l2 device registered\n");
6205720ceacacc Robby Cai 2019-09-27  1144  
6205720ceacacc Robby Cai 2019-09-27  1145  	/* .. and a pointer to the subdev. */
6205720ceacacc Robby Cai 2019-09-27  1146  	platform_set_drvdata(pdev, state);
6205720ceacacc Robby Cai 2019-09-27  1147  
6205720ceacacc Robby Cai 2019-09-27  1148  	ret = mipi_csis_subdev_init(&state->mipi_sd, pdev, &mipi_csis_subdev_ops);
6205720ceacacc Robby Cai 2019-09-27  1149  	if (ret < 0)
6205720ceacacc Robby Cai 2019-09-27  1150  		goto e_sd_mipi;
6205720ceacacc Robby Cai 2019-09-27  1151  
6205720ceacacc Robby Cai 2019-09-27  1152  	memcpy(state->events, mipi_csis_events, sizeof(state->events));
6205720ceacacc Robby Cai 2019-09-27  1153  
6205720ceacacc Robby Cai 2019-09-27  1154  	/* subdev host register */
6205720ceacacc Robby Cai 2019-09-27  1155  	ret = mipi_csis_subdev_host(state);
6205720ceacacc Robby Cai 2019-09-27  1156  	if (ret < 0)
6205720ceacacc Robby Cai 2019-09-27  1157  		goto e_sd_host;
6205720ceacacc Robby Cai 2019-09-27  1158  
6205720ceacacc Robby Cai 2019-09-27  1159  	pm_runtime_enable(dev);
6205720ceacacc Robby Cai 2019-09-27  1160  	if (!pm_runtime_enabled(dev)) {
6205720ceacacc Robby Cai 2019-09-27  1161  		ret = mipi_csis_pm_resume(dev, true);
6205720ceacacc Robby Cai 2019-09-27  1162  		if (ret < 0)
6205720ceacacc Robby Cai 2019-09-27  1163  			goto e_sd_host;
6205720ceacacc Robby Cai 2019-09-27  1164  	}
6205720ceacacc Robby Cai 2019-09-27  1165  
7c4cd7b96a97c3 Robby Cai 2019-12-05  1166  	mipi_csis_clk_disable(state);
6205720ceacacc Robby Cai 2019-09-27  1167  	dev_info(&pdev->dev,
6205720ceacacc Robby Cai 2019-09-27  1168  			"lanes: %d, hs_settle: %d, clk_settle: %d, wclk: %d, freq: %u\n",
6205720ceacacc Robby Cai 2019-09-27  1169  		 state->num_lanes, state->hs_settle, state->clk_settle,
6205720ceacacc Robby Cai 2019-09-27  1170  		 state->wclk_ext, state->clk_frequency);
6205720ceacacc Robby Cai 2019-09-27  1171  	return 0;
6205720ceacacc Robby Cai 2019-09-27  1172  
6205720ceacacc Robby Cai 2019-09-27  1173  e_sd_host:
6205720ceacacc Robby Cai 2019-09-27  1174  	v4l2_async_notifier_unregister(&state->subdev_notifier);
6205720ceacacc Robby Cai 2019-09-27  1175  	v4l2_device_unregister(&state->v4l2_dev);
6205720ceacacc Robby Cai 2019-09-27  1176  e_sd_mipi:
6205720ceacacc Robby Cai 2019-09-27  1177  	v4l2_async_unregister_subdev(&state->mipi_sd);
6205720ceacacc Robby Cai 2019-09-27  1178  e_clkdis:
6205720ceacacc Robby Cai 2019-09-27  1179  	mipi_csis_clk_disable(state);
6205720ceacacc Robby Cai 2019-09-27  1180  	return ret;
6205720ceacacc Robby Cai 2019-09-27  1181  }
6205720ceacacc Robby Cai 2019-09-27  1182  
6205720ceacacc Robby Cai 2019-09-27  1183  static int mipi_csis_pm_suspend(struct device *dev, bool runtime)
6205720ceacacc Robby Cai 2019-09-27  1184  {
6205720ceacacc Robby Cai 2019-09-27  1185  	struct platform_device *pdev = to_platform_device(dev);
6205720ceacacc Robby Cai 2019-09-27  1186  	struct csi_state *state = platform_get_drvdata(pdev);
6205720ceacacc Robby Cai 2019-09-27  1187  	struct v4l2_subdev *mipi_sd = &state->mipi_sd;
6205720ceacacc Robby Cai 2019-09-27  1188  	int ret = 0;
6205720ceacacc Robby Cai 2019-09-27  1189  
6205720ceacacc Robby Cai 2019-09-27  1190  	v4l2_dbg(1, debug, mipi_sd, "%s: flags: 0x%x\n",
6205720ceacacc Robby Cai 2019-09-27  1191  		 __func__, state->flags);
6205720ceacacc Robby Cai 2019-09-27  1192  
6205720ceacacc Robby Cai 2019-09-27  1193  	mutex_lock(&state->lock);
6205720ceacacc Robby Cai 2019-09-27  1194  	if (state->flags & ST_POWERED) {
6205720ceacacc Robby Cai 2019-09-27  1195  		mipi_csis_stop_stream(state);
6205720ceacacc Robby Cai 2019-09-27  1196  		ret = regulator_disable(state->mipi_phy_regulator);
6205720ceacacc Robby Cai 2019-09-27  1197  		if (ret)
6205720ceacacc Robby Cai 2019-09-27  1198  			goto unlock;
6205720ceacacc Robby Cai 2019-09-27  1199  		mipi_csis_clk_disable(state);
6205720ceacacc Robby Cai 2019-09-27  1200  		state->flags &= ~ST_POWERED;
6205720ceacacc Robby Cai 2019-09-27  1201  		if (!runtime)
6205720ceacacc Robby Cai 2019-09-27  1202  			state->flags |= ST_SUSPENDED;
6205720ceacacc Robby Cai 2019-09-27  1203  	}
6205720ceacacc Robby Cai 2019-09-27  1204   unlock:
6205720ceacacc Robby Cai 2019-09-27  1205  	mutex_unlock(&state->lock);
6205720ceacacc Robby Cai 2019-09-27  1206  	return ret ? -EAGAIN : 0;
6205720ceacacc Robby Cai 2019-09-27  1207  }
6205720ceacacc Robby Cai 2019-09-27  1208  
6205720ceacacc Robby Cai 2019-09-27  1209  static int mipi_csis_pm_resume(struct device *dev, bool runtime)
6205720ceacacc Robby Cai 2019-09-27  1210  {
6205720ceacacc Robby Cai 2019-09-27  1211  	struct platform_device *pdev = to_platform_device(dev);
6205720ceacacc Robby Cai 2019-09-27  1212  	struct csi_state *state = platform_get_drvdata(pdev);
6205720ceacacc Robby Cai 2019-09-27  1213  	struct v4l2_subdev *mipi_sd = &state->mipi_sd;
6205720ceacacc Robby Cai 2019-09-27  1214  	int ret = 0;
6205720ceacacc Robby Cai 2019-09-27  1215  
6205720ceacacc Robby Cai 2019-09-27  1216  	v4l2_dbg(1, debug, mipi_sd, "%s: flags: 0x%x\n",
6205720ceacacc Robby Cai 2019-09-27  1217  		 __func__, state->flags);
6205720ceacacc Robby Cai 2019-09-27  1218  
6205720ceacacc Robby Cai 2019-09-27  1219  	mutex_lock(&state->lock);
6205720ceacacc Robby Cai 2019-09-27  1220  	if (!runtime && !(state->flags & ST_SUSPENDED))
6205720ceacacc Robby Cai 2019-09-27  1221  		goto unlock;
6205720ceacacc Robby Cai 2019-09-27  1222  
6205720ceacacc Robby Cai 2019-09-27  1223  	if (!(state->flags & ST_POWERED)) {
6205720ceacacc Robby Cai 2019-09-27  1224  		ret = regulator_enable(state->mipi_phy_regulator);
6205720ceacacc Robby Cai 2019-09-27  1225  		if (!ret) {
6205720ceacacc Robby Cai 2019-09-27  1226  			state->flags |= ST_POWERED;
6205720ceacacc Robby Cai 2019-09-27  1227  		} else {
6205720ceacacc Robby Cai 2019-09-27  1228  			goto unlock;
6205720ceacacc Robby Cai 2019-09-27  1229  		}
6205720ceacacc Robby Cai 2019-09-27  1230  		mipi_csis_clk_enable(state);
6205720ceacacc Robby Cai 2019-09-27  1231  	}
6205720ceacacc Robby Cai 2019-09-27  1232  	if (state->flags & ST_STREAMING)
6205720ceacacc Robby Cai 2019-09-27  1233  		mipi_csis_start_stream(state);
6205720ceacacc Robby Cai 2019-09-27  1234  
6205720ceacacc Robby Cai 2019-09-27  1235  	state->flags &= ~ST_SUSPENDED;
6205720ceacacc Robby Cai 2019-09-27  1236   unlock:
6205720ceacacc Robby Cai 2019-09-27  1237  	mutex_unlock(&state->lock);
6205720ceacacc Robby Cai 2019-09-27  1238  	return ret ? -EAGAIN : 0;
6205720ceacacc Robby Cai 2019-09-27  1239  }
6205720ceacacc Robby Cai 2019-09-27  1240  
6205720ceacacc Robby Cai 2019-09-27  1241  #ifdef CONFIG_PM_SLEEP
6205720ceacacc Robby Cai 2019-09-27  1242  static int mipi_csis_suspend(struct device *dev)
6205720ceacacc Robby Cai 2019-09-27  1243  {
6205720ceacacc Robby Cai 2019-09-27  1244  	struct platform_device *pdev = to_platform_device(dev);
6205720ceacacc Robby Cai 2019-09-27  1245  	struct csi_state *state = platform_get_drvdata(pdev);
6205720ceacacc Robby Cai 2019-09-27  1246  
6205720ceacacc Robby Cai 2019-09-27  1247  	if (state->flags & ST_STREAMING) {
6205720ceacacc Robby Cai 2019-09-27  1248  		dev_warn(dev, "running, prevent entering suspend.\n");
6205720ceacacc Robby Cai 2019-09-27  1249  		return -EAGAIN;
6205720ceacacc Robby Cai 2019-09-27  1250  	}
6205720ceacacc Robby Cai 2019-09-27  1251  
6205720ceacacc Robby Cai 2019-09-27  1252  	return mipi_csis_pm_suspend(dev, false);
6205720ceacacc Robby Cai 2019-09-27  1253  }
6205720ceacacc Robby Cai 2019-09-27  1254  
6205720ceacacc Robby Cai 2019-09-27  1255  static int mipi_csis_resume(struct device *dev)
6205720ceacacc Robby Cai 2019-09-27  1256  {
6205720ceacacc Robby Cai 2019-09-27  1257  	return mipi_csis_pm_resume(dev, false);
6205720ceacacc Robby Cai 2019-09-27  1258  }
6205720ceacacc Robby Cai 2019-09-27  1259  #endif
6205720ceacacc Robby Cai 2019-09-27  1260  
6205720ceacacc Robby Cai 2019-09-27 @1261  static int mipi_csis_runtime_suspend(struct device *dev)
6205720ceacacc Robby Cai 2019-09-27  1262  {
6205720ceacacc Robby Cai 2019-09-27  1263  	return mipi_csis_pm_suspend(dev, true);
6205720ceacacc Robby Cai 2019-09-27  1264  }
6205720ceacacc Robby Cai 2019-09-27  1265  
6205720ceacacc Robby Cai 2019-09-27 @1266  static int mipi_csis_runtime_resume(struct device *dev)
6205720ceacacc Robby Cai 2019-09-27  1267  {
6205720ceacacc Robby Cai 2019-09-27  1268  	return mipi_csis_pm_resume(dev, true);
6205720ceacacc Robby Cai 2019-09-27  1269  }
6205720ceacacc Robby Cai 2019-09-27  1270  

:::::: The code at line 1266 was first introduced by commit
:::::: 6205720ceacacce82f3e8dba6816a1dbffcd903c media: mipi csi: add samsung's mipi csi support

:::::: TO: Robby Cai <robby.cai@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
