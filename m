Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D9C77B
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Feb 2023 15:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675609526; x=1707145526;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VTdu831QUZ7bgIlSH6Hk9g9z/g6KgDFlqe3rQP1whyo=;
  b=iVC2hLOziKqnNWyWNouU4tyRn+KQlfRIAguI8FHCWDo9hkuOgyhAIQEE
   gf1aD8rOSDM+/puk/S/AFhHHhSlg8Zvkm6xPNAcOV0dwpgkhOAnf/S6kP
   +YggzPt8XcOH20vnz1aT585HPwJRvHBd8aCA/Hark44Ia6e7ygnwsdWhM
   6MrTsXIojHqwBIpzSLgSNFNFRf8ccvBlASM10o7Awvehw0BAkp2Nayrgk
   JjbzcnVE7wZ4/yMe4V9Sy+L8KOHzjnObM28FD9gICD+9cYpjRlVEcG6uu
   VzEzX+HQvWV43/FwNNIfBLCMBp5N/w0Td9gnaTdX2+wFltCDGOBmWw6J7
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="309387748"
X-IronPort-AV: E=Sophos;i="5.97,275,1669104000"; 
   d="scan'208";a="309387748"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2023 07:05:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="755005012"
X-IronPort-AV: E=Sophos;i="5.97,275,1669104000"; 
   d="scan'208";a="755005012"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 05 Feb 2023 07:05:22 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOga1-000248-2Q;
	Sun, 05 Feb 2023 15:05:21 +0000
Date: Sun, 5 Feb 2023 23:04:46 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.2.x-imx 6076/20209]
 drivers/media/platform/mxc/capture/mxc_mipi_csi.c:1075:29: warning: variable
 'mipi_sd' set but not used
Message-ID: <202302052307.F4OaQgLn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dong,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc 5.15-2.2.x-imx
head:   3248ffcb12d15a0e40b9a020ba362591b8137923
commit: b0519c4b9531e65e71b3ff5db18553d6ad840099 [6076/20209] Merge remote-tracking branch 'origin/capture/mxc' into capture/next
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230205/202302052307.F4OaQgLn-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Freescale/linux-fslc/commit/b0519c4b9531e65e71b3ff5db18553d6ad840099
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc 5.15-2.2.x-imx
        git checkout b0519c4b9531e65e71b3ff5db18553d6ad840099
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/accessibility/speakup/ drivers/base/power/ drivers/dma/ drivers/firmware/imx/ drivers/gpu/drm/bridge/ drivers/gpu/drm/imx/ drivers/i2c/busses/ drivers/input/touchscreen/ drivers/mailbox/ drivers/media/platform/mxc/capture/ drivers/mtd/nand/raw/gpmi-nand/ drivers/net/ethernet/freescale/ drivers/net/phy/ drivers/pci/controller/dwc/ drivers/pci/controller/mobiveil/ drivers/power/supply/ drivers/pwm/ drivers/regulator/ drivers/rpmsg/ drivers/soc/imx/ drivers/staging/ drivers/thermal/ drivers/video/fbdev/ net/ sound/soc/fsl/ sound/soc/sof/imx/ sound/soc/sof/intel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/media/platform/mxc/capture/mxc_mipi_csi.c: In function 'mipi_csis_probe':
>> drivers/media/platform/mxc/capture/mxc_mipi_csi.c:1075:29: warning: variable 'mipi_sd' set but not used [-Wunused-but-set-variable]
    1075 |         struct v4l2_subdev *mipi_sd;
         |                             ^~~~~~~


vim +/mipi_sd +1075 drivers/media/platform/mxc/capture/mxc_mipi_csi.c

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

:::::: The code at line 1075 was first introduced by commit
:::::: 6205720ceacacce82f3e8dba6816a1dbffcd903c media: mipi csi: add samsung's mipi csi support

:::::: TO: Robby Cai <robby.cai@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
