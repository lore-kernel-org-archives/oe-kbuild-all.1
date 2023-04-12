Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 922446121
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Apr 2023 16:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681315452; x=1712851452;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dl3MSvV+D3cLr2w7oN7SeKHm+kdEWngur/taE/3Q2ss=;
  b=lPYieykhzJwxcE9LKK8Pc8032yO8A/G2i7ijjpIZQth9XcMxjducYtlj
   vbxFJDUr1iwbPOFhzgZXvumMozjne1E2TxgosedUiY18uN6EVSlHwojol
   GepZP2t+XmRMuGcG2kfix5ejfRbhiEpEGZm5V49u0Lmo6SOymZozscNYj
   TKRKPdIk6P8VzxvxGmJLlDXmd20JZx7hTaw3DfdzykjKOOtLwmCjMK/AJ
   tNDdWrgPZR8ja3DNfeoGKV1eiKxJiUwDZzAZQmKCyo+B8cFs7iHPa4KFe
   3AHYSTamCZl+DFgubD3hUzDAxx/SLXxpp2yxpGtAz9A7igXigEf/s5aZ8
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="341435773"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; 
   d="scan'208";a="341435773"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2023 09:03:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="719430905"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; 
   d="scan'208";a="719430905"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 12 Apr 2023 09:03:14 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pmcwD-000Xp3-0y;
	Wed, 12 Apr 2023 16:03:13 +0000
Date: Thu, 13 Apr 2023 00:02:37 +0800
From: kernel test robot <lkp@intel.com>
To: Venkateshwar Rao Gannavarapu <venkateshwar.rao.gannavarapu@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Michal Simek <monstr@monstr.eu>,
	Vishal Sagar <vishal.sagar@xilinx.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.1_LTS 564/1065]
 drivers/gpu/drm/xlnx/xlnx_pl_disp.c:613:9: warning: 'strncpy' specified
 bound 4 equals destination size
Message-ID: <202304122304.pSEO8T5Y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.1_LTS
head:   e5753363b5e03fc0a3055d5476c6cca93e9ea28b
commit: 630a3885d12f98cf345908559fa9b0ec7a4302f3 [564/1065] drm: xlnx: pl_disp: Add strict check of video format in dt parsing.
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230412/202304122304.pSEO8T5Y-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Xilinx/linux-xlnx/commit/630a3885d12f98cf345908559fa9b0ec7a4302f3
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx xlnx_rebase_v6.1_LTS
        git checkout 630a3885d12f98cf345908559fa9b0ec7a4302f3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=alpha olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=alpha SHELL=/bin/bash drivers/gpu/drm/xlnx/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304122304.pSEO8T5Y-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/xlnx/xlnx_pl_disp.c: In function 'xlnx_pl_disp_probe':
>> drivers/gpu/drm/xlnx/xlnx_pl_disp.c:613:9: warning: 'strncpy' specified bound 4 equals destination size [-Wstringop-truncation]
     613 |         strncpy((char *)&xlnx_pl_disp->fmt, vformat, XLNX_PL_DISP_VFMT_SIZE);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/strncpy +613 drivers/gpu/drm/xlnx/xlnx_pl_disp.c

   579	
   580	static int xlnx_pl_disp_probe(struct platform_device *pdev)
   581	{
   582		struct device *dev = &pdev->dev;
   583		struct device_node *vtc_node;
   584		struct xlnx_pl_disp *xlnx_pl_disp;
   585		int ret;
   586		const char *vformat;
   587		struct dma_chan *dma_chan;
   588		struct xlnx_dma_chan *xlnx_dma_chan;
   589		const struct drm_format_info *info;
   590	
   591		xlnx_pl_disp = devm_kzalloc(dev, sizeof(*xlnx_pl_disp), GFP_KERNEL);
   592		if (!xlnx_pl_disp)
   593			return -ENOMEM;
   594	
   595		dma_chan = of_dma_request_slave_channel(dev->of_node, "dma0");
   596		if (IS_ERR_OR_NULL(dma_chan)) {
   597			dev_err(dev, "failed to request dma channel\n");
   598			return PTR_ERR(dma_chan);
   599		}
   600	
   601		xlnx_dma_chan = devm_kzalloc(dev, sizeof(*xlnx_dma_chan), GFP_KERNEL);
   602		if (!xlnx_dma_chan)
   603			return -ENOMEM;
   604	
   605		xlnx_dma_chan->dma_chan = dma_chan;
   606		xlnx_pl_disp->chan = xlnx_dma_chan;
   607		ret = of_property_read_string(dev->of_node, "xlnx,vformat", &vformat);
   608		if (ret) {
   609			dev_err(dev, "No xlnx,vformat value in dts\n");
   610			goto err_dma;
   611		}
   612	
 > 613		strncpy((char *)&xlnx_pl_disp->fmt, vformat, XLNX_PL_DISP_VFMT_SIZE);
   614		info = drm_format_info(xlnx_pl_disp->fmt);
   615		if (!info) {
   616			dev_err(dev, "Invalid video format in dts\n");
   617			ret = -EINVAL;
   618			goto err_dma;
   619		}
   620	
   621		/* VTC Bridge support */
   622		vtc_node = of_parse_phandle(dev->of_node, "xlnx,bridge", 0);
   623		if (vtc_node) {
   624			xlnx_pl_disp->vtc_bridge = of_xlnx_bridge_get(vtc_node);
   625			if (!xlnx_pl_disp->vtc_bridge) {
   626				dev_info(dev, "Didn't get vtc bridge instance\n");
   627				ret = -EPROBE_DEFER;
   628				goto err_dma;
   629			}
   630		} else {
   631			dev_info(dev, "vtc bridge property not present\n");
   632		}
   633	
   634		xlnx_pl_disp->dev = dev;
   635		platform_set_drvdata(pdev, xlnx_pl_disp);
   636	
   637		ret = component_add(dev, &xlnx_pl_disp_component_ops);
   638		if (ret)
   639			goto err_dma;
   640	
   641		xlnx_pl_disp->master = xlnx_drm_pipeline_init(pdev);
   642		if (IS_ERR(xlnx_pl_disp->master)) {
   643			ret = PTR_ERR(xlnx_pl_disp->master);
   644			dev_err(dev, "failed to initialize the drm pipeline\n");
   645			goto err_component;
   646		}
   647	
   648		dev_info(&pdev->dev, "Xlnx PL display driver probed\n");
   649	
   650		return 0;
   651	
   652	err_component:
   653		component_del(dev, &xlnx_pl_disp_component_ops);
   654	err_dma:
   655		dma_release_channel(xlnx_pl_disp->chan->dma_chan);
   656	
   657		return ret;
   658	}
   659	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
