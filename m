Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD9D200A8
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Jun 2023 17:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687456505; x=1718992505;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LTz5YfhE4YE8b/pNoqLZHrSC9TyrjCcmj3XUIwIn3rc=;
  b=nXcPJvfrjNR66Vevrszs7GU2vkf+a69279w18kxAKhRJX1Ur4rSQZAlT
   bVlJhss2yVHjR10SgKb2Yyu71yeswcjtuwQhndKfknvngtR2StAmnGTnE
   mYxmS3NHPJ0iZjmsQOggKHFDYTd02xQfIXyGdC4ZTmxUou4P6O9L8yWXq
   IleKQXhLT59GdIHp/PnV/3uCAT9KAhUOyOuiTK6f+T2WUx1rR8fSiD/bc
   gI99NECeKc792v9PkastCHRtlwaV5DKycxoee2YIjCFQ4l8itLA05PqVZ
   1DXvwyduH7tB7AQi2rGI+hf2+HabpR5TzqM5YreRkcWnYUStYVgkJC7am
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="446940512"
X-IronPort-AV: E=Sophos;i="6.01,149,1684825200"; 
   d="scan'208";a="446940512"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2023 10:54:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="839157388"
X-IronPort-AV: E=Sophos;i="6.01,149,1684825200"; 
   d="scan'208";a="839157388"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 22 Jun 2023 10:54:45 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qCOW4-0007ip-2V;
	Thu, 22 Jun 2023 17:54:44 +0000
Date: Fri, 23 Jun 2023 01:54:24 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-1.0.x-imx 4751/9881]
 drivers/media/platform/mxc/capture/mxc_mipi_csi.c:1075:29: warning: variable
 'mipi_sd' set but not used
Message-ID: <202306230117.R4jXdrWV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dong,

First bad commit (maybe != root cause):

tree:   https://github.com/Freescale/linux-fslc 6.1-1.0.x-imx
head:   3260d1af47b1bedfe12b79a26efa184b9a60a8a3
commit: b3bbdb2a80a2895f190786815f3c3b9cf7123ee6 [4751/9881] Merge remote-tracking branch 'origin/capture/mxc' into capture/next
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20230623/202306230117.R4jXdrWV-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230623/202306230117.R4jXdrWV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306230117.R4jXdrWV-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/platform/mxc/capture/mxc_mipi_csi.c: In function 'mipi_csis_probe':
>> drivers/media/platform/mxc/capture/mxc_mipi_csi.c:1075:29: warning: variable 'mipi_sd' set but not used [-Wunused-but-set-variable]
    1075 |         struct v4l2_subdev *mipi_sd;
         |                             ^~~~~~~


vim +/mipi_sd +1075 drivers/media/platform/mxc/capture/mxc_mipi_csi.c

4399e4b7ed5e4e Robby Cai 2019-09-27  1071  
4399e4b7ed5e4e Robby Cai 2019-09-27  1072  static int mipi_csis_probe(struct platform_device *pdev)
4399e4b7ed5e4e Robby Cai 2019-09-27  1073  {
4399e4b7ed5e4e Robby Cai 2019-09-27  1074  	struct device *dev = &pdev->dev;
4399e4b7ed5e4e Robby Cai 2019-09-27 @1075  	struct v4l2_subdev *mipi_sd;
4399e4b7ed5e4e Robby Cai 2019-09-27  1076  	struct resource *mem_res;
4399e4b7ed5e4e Robby Cai 2019-09-27  1077  	struct csi_state *state;
4399e4b7ed5e4e Robby Cai 2019-09-27  1078  	const struct of_device_id *of_id;
4399e4b7ed5e4e Robby Cai 2019-09-27  1079  	mipi_csis_phy_reset_t phy_reset_fn;
4399e4b7ed5e4e Robby Cai 2019-09-27  1080  	int ret = -ENOMEM;
4399e4b7ed5e4e Robby Cai 2019-09-27  1081  
4399e4b7ed5e4e Robby Cai 2019-09-27  1082  	state = devm_kzalloc(dev, sizeof(*state), GFP_KERNEL);
4399e4b7ed5e4e Robby Cai 2019-09-27  1083  	if (!state)
4399e4b7ed5e4e Robby Cai 2019-09-27  1084  		return -ENOMEM;
4399e4b7ed5e4e Robby Cai 2019-09-27  1085  
4399e4b7ed5e4e Robby Cai 2019-09-27  1086  	mutex_init(&state->lock);
4399e4b7ed5e4e Robby Cai 2019-09-27  1087  	spin_lock_init(&state->slock);
4399e4b7ed5e4e Robby Cai 2019-09-27  1088  
4399e4b7ed5e4e Robby Cai 2019-09-27  1089  	state->pdev = pdev;
4399e4b7ed5e4e Robby Cai 2019-09-27  1090  	mipi_sd = &state->mipi_sd;
4399e4b7ed5e4e Robby Cai 2019-09-27  1091  	state->dev = dev;
4399e4b7ed5e4e Robby Cai 2019-09-27  1092  
4399e4b7ed5e4e Robby Cai 2019-09-27  1093  	ret = mipi_csis_parse_dt(pdev, state);
4399e4b7ed5e4e Robby Cai 2019-09-27  1094  	if (ret < 0)
4399e4b7ed5e4e Robby Cai 2019-09-27  1095  		return ret;
4399e4b7ed5e4e Robby Cai 2019-09-27  1096  
4399e4b7ed5e4e Robby Cai 2019-09-27  1097  	if (state->num_lanes == 0 || state->num_lanes > state->max_num_lanes) {
4399e4b7ed5e4e Robby Cai 2019-09-27  1098  		dev_err(dev, "Unsupported number of data lanes: %d (max. %d)\n",
4399e4b7ed5e4e Robby Cai 2019-09-27  1099  			state->num_lanes, state->max_num_lanes);
4399e4b7ed5e4e Robby Cai 2019-09-27  1100  		return -EINVAL;
4399e4b7ed5e4e Robby Cai 2019-09-27  1101  	}
4399e4b7ed5e4e Robby Cai 2019-09-27  1102  
4399e4b7ed5e4e Robby Cai 2019-09-27  1103  	mipi_csis_phy_init(state);
4399e4b7ed5e4e Robby Cai 2019-09-27  1104  	of_id = of_match_node(mipi_csis_of_match, dev->of_node);
4399e4b7ed5e4e Robby Cai 2019-09-27  1105  	if (!of_id || !of_id->data)
4399e4b7ed5e4e Robby Cai 2019-09-27  1106  		return -EINVAL;
4399e4b7ed5e4e Robby Cai 2019-09-27  1107  
4399e4b7ed5e4e Robby Cai 2019-09-27  1108  	phy_reset_fn = of_id->data;
4399e4b7ed5e4e Robby Cai 2019-09-27  1109  
4399e4b7ed5e4e Robby Cai 2019-09-27  1110  	mem_res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
4399e4b7ed5e4e Robby Cai 2019-09-27  1111  	state->regs = devm_ioremap_resource(dev, mem_res);
4399e4b7ed5e4e Robby Cai 2019-09-27  1112  	if (IS_ERR(state->regs))
4399e4b7ed5e4e Robby Cai 2019-09-27  1113  		return PTR_ERR(state->regs);
4399e4b7ed5e4e Robby Cai 2019-09-27  1114  
4399e4b7ed5e4e Robby Cai 2019-09-27  1115  	state->irq = platform_get_irq(pdev, 0);
4399e4b7ed5e4e Robby Cai 2019-09-27  1116  	if (state->irq < 0) {
4399e4b7ed5e4e Robby Cai 2019-09-27  1117  		dev_err(dev, "Failed to get irq\n");
4399e4b7ed5e4e Robby Cai 2019-09-27  1118  		return state->irq;
4399e4b7ed5e4e Robby Cai 2019-09-27  1119  	}
4399e4b7ed5e4e Robby Cai 2019-09-27  1120  
4399e4b7ed5e4e Robby Cai 2019-09-27  1121  	ret = mipi_csis_clk_get(state);
4399e4b7ed5e4e Robby Cai 2019-09-27  1122  	if (ret < 0)
4399e4b7ed5e4e Robby Cai 2019-09-27  1123  		return ret;
4399e4b7ed5e4e Robby Cai 2019-09-27  1124  
4399e4b7ed5e4e Robby Cai 2019-09-27  1125  	mipi_csis_clk_enable(state);
4399e4b7ed5e4e Robby Cai 2019-09-27  1126  
4399e4b7ed5e4e Robby Cai 2019-09-27  1127  	phy_reset_fn(state);
4399e4b7ed5e4e Robby Cai 2019-09-27  1128  
4399e4b7ed5e4e Robby Cai 2019-09-27  1129  	ret = devm_request_irq(dev, state->irq, mipi_csis_irq_handler,
4399e4b7ed5e4e Robby Cai 2019-09-27  1130  			       0, dev_name(dev), state);
4399e4b7ed5e4e Robby Cai 2019-09-27  1131  	if (ret) {
4399e4b7ed5e4e Robby Cai 2019-09-27  1132  		dev_err(dev, "Interrupt request failed\n");
4399e4b7ed5e4e Robby Cai 2019-09-27  1133  		goto e_clkdis;
4399e4b7ed5e4e Robby Cai 2019-09-27  1134  	}
4399e4b7ed5e4e Robby Cai 2019-09-27  1135  
4399e4b7ed5e4e Robby Cai 2019-09-27  1136  	/* First register a v4l2 device */
4399e4b7ed5e4e Robby Cai 2019-09-27  1137  	ret = v4l2_device_register(dev, &state->v4l2_dev);
4399e4b7ed5e4e Robby Cai 2019-09-27  1138  	if (ret) {
4399e4b7ed5e4e Robby Cai 2019-09-27  1139  		v4l2_err(dev->driver,
4399e4b7ed5e4e Robby Cai 2019-09-27  1140  			"Unable to register v4l2 device.\n");
4399e4b7ed5e4e Robby Cai 2019-09-27  1141  		goto e_clkdis;
4399e4b7ed5e4e Robby Cai 2019-09-27  1142  	}
4399e4b7ed5e4e Robby Cai 2019-09-27  1143  	v4l2_info(&state->v4l2_dev, "mipi csi v4l2 device registered\n");
4399e4b7ed5e4e Robby Cai 2019-09-27  1144  
4399e4b7ed5e4e Robby Cai 2019-09-27  1145  	/* .. and a pointer to the subdev. */
4399e4b7ed5e4e Robby Cai 2019-09-27  1146  	platform_set_drvdata(pdev, state);
4399e4b7ed5e4e Robby Cai 2019-09-27  1147  
4399e4b7ed5e4e Robby Cai 2019-09-27  1148  	ret = mipi_csis_subdev_init(&state->mipi_sd, pdev, &mipi_csis_subdev_ops);
4399e4b7ed5e4e Robby Cai 2019-09-27  1149  	if (ret < 0)
4399e4b7ed5e4e Robby Cai 2019-09-27  1150  		goto e_sd_mipi;
4399e4b7ed5e4e Robby Cai 2019-09-27  1151  
4399e4b7ed5e4e Robby Cai 2019-09-27  1152  	memcpy(state->events, mipi_csis_events, sizeof(state->events));
4399e4b7ed5e4e Robby Cai 2019-09-27  1153  
4399e4b7ed5e4e Robby Cai 2019-09-27  1154  	/* subdev host register */
4399e4b7ed5e4e Robby Cai 2019-09-27  1155  	ret = mipi_csis_subdev_host(state);
4399e4b7ed5e4e Robby Cai 2019-09-27  1156  	if (ret < 0)
4399e4b7ed5e4e Robby Cai 2019-09-27  1157  		goto e_sd_host;
4399e4b7ed5e4e Robby Cai 2019-09-27  1158  
4399e4b7ed5e4e Robby Cai 2019-09-27  1159  	pm_runtime_enable(dev);
4399e4b7ed5e4e Robby Cai 2019-09-27  1160  	if (!pm_runtime_enabled(dev)) {
4399e4b7ed5e4e Robby Cai 2019-09-27  1161  		ret = mipi_csis_pm_resume(dev, true);
4399e4b7ed5e4e Robby Cai 2019-09-27  1162  		if (ret < 0)
4399e4b7ed5e4e Robby Cai 2019-09-27  1163  			goto e_sd_host;
4399e4b7ed5e4e Robby Cai 2019-09-27  1164  	}
4399e4b7ed5e4e Robby Cai 2019-09-27  1165  
c554fbcb569c2a Robby Cai 2019-12-05  1166  	mipi_csis_clk_disable(state);
4399e4b7ed5e4e Robby Cai 2019-09-27  1167  	dev_info(&pdev->dev,
4399e4b7ed5e4e Robby Cai 2019-09-27  1168  			"lanes: %d, hs_settle: %d, clk_settle: %d, wclk: %d, freq: %u\n",
4399e4b7ed5e4e Robby Cai 2019-09-27  1169  		 state->num_lanes, state->hs_settle, state->clk_settle,
4399e4b7ed5e4e Robby Cai 2019-09-27  1170  		 state->wclk_ext, state->clk_frequency);
4399e4b7ed5e4e Robby Cai 2019-09-27  1171  	return 0;
4399e4b7ed5e4e Robby Cai 2019-09-27  1172  
4399e4b7ed5e4e Robby Cai 2019-09-27  1173  e_sd_host:
c4dea940c47722 Robby Cai 2021-08-30  1174  	v4l2_async_nf_unregister(&state->subdev_notifier);
4399e4b7ed5e4e Robby Cai 2019-09-27  1175  	v4l2_device_unregister(&state->v4l2_dev);
4399e4b7ed5e4e Robby Cai 2019-09-27  1176  e_sd_mipi:
4399e4b7ed5e4e Robby Cai 2019-09-27  1177  	v4l2_async_unregister_subdev(&state->mipi_sd);
4399e4b7ed5e4e Robby Cai 2019-09-27  1178  e_clkdis:
4399e4b7ed5e4e Robby Cai 2019-09-27  1179  	mipi_csis_clk_disable(state);
4399e4b7ed5e4e Robby Cai 2019-09-27  1180  	return ret;
4399e4b7ed5e4e Robby Cai 2019-09-27  1181  }
4399e4b7ed5e4e Robby Cai 2019-09-27  1182  

:::::: The code at line 1075 was first introduced by commit
:::::: 4399e4b7ed5e4e59c729e6fad98470977ccba862 media: mipi csi: add samsung's mipi csi support

:::::: TO: Robby Cai <robby.cai@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
