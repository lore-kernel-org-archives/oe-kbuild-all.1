Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 168931DDF4
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Oct 2023 10:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HjIWkPrx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697451421; x=1728987421;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=872IldasxUN4fuJ4Xm7B3XkvO/GTbmheEwTB0OcADR8=;
  b=HjIWkPrxgclIRFOutxKF7/r9ZM2bN2LydMqCkxJ0FmwxpXIc70gYNDJh
   ivtocK9K3wKw1Bt6vJGH+dTc4A9e+lJdkkgDG1CY95Nql1xGHftWcidNc
   OZucfh3Wh7qjZwBUwRa9IMwsd/+hrWcWSq6jt9mP20Nx/bfEhh38/CAwG
   /FzewIa9Ymkfy+8kp/qbp6A7Taz9+pjTYjsBmc4/gcKcTIo2JO7tTIGE3
   FcHOAitbs2r10kPoovpRWwOf5dDsYYccVc8vUSR3xCU92HimDV61UqNgF
   7by7AzAuTQc3Ah4/UN2Zi+BdH8fi7E5prsY9wGPNY/BwokLsJcYeUfIcV
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="385333982"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; 
   d="scan'208";a="385333982"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2023 03:17:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="785038765"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; 
   d="scan'208";a="785038765"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 16 Oct 2023 03:16:58 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsKee-0008IJ-0g;
	Mon, 16 Oct 2023 10:16:56 +0000
Date: Mon, 16 Oct 2023 18:16:14 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.1.x-imx 553/15768]
 drivers/clk/imx/clk-blk-ctrl.c:305:34: warning: 'imx_blk_ctrl_of_match'
 defined but not used
Message-ID: <202310161821.S4V4w18I-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.1-2.1.x-imx
head:   3f41fbe42851375d3d5996e4bf9e9809e6c79517
commit: 78668ad4d3771b2b0caca88d8bea83e4f438f8b5 [553/15768] clk: imx: Add blk_ctrl combo driver
config: i386-buildonly-randconfig-002-20231016 (https://download.01.org/0day-ci/archive/20231016/202310161821.S4V4w18I-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231016/202310161821.S4V4w18I-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310161821.S4V4w18I-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/clk/imx/clk-blk-ctrl.c: In function 'imx_blk_ctrl_register_one_clock':
   drivers/clk/imx/clk-blk-ctrl.c:140:12: error: implicit declaration of function 'imx_dev_clk_hw_mux_flags'; did you mean 'imx_clk_hw_mux_flags'? [-Werror=implicit-function-declaration]
     140 |   clk_hw = imx_dev_clk_hw_mux_flags(dev, hw->name,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~
         |            imx_clk_hw_mux_flags
   drivers/clk/imx/clk-blk-ctrl.c:140:10: warning: assignment to 'struct clk_hw *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     140 |   clk_hw = imx_dev_clk_hw_mux_flags(dev, hw->name,
         |          ^
   drivers/clk/imx/clk-blk-ctrl.c:148:12: error: implicit declaration of function 'imx_dev_clk_hw_gate'; did you mean 'imx_clk_hw_gate'? [-Werror=implicit-function-declaration]
     148 |   clk_hw = imx_dev_clk_hw_gate(dev, hw->name, hw->parents,
         |            ^~~~~~~~~~~~~~~~~~~
         |            imx_clk_hw_gate
   drivers/clk/imx/clk-blk-ctrl.c:148:10: warning: assignment to 'struct clk_hw *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     148 |   clk_hw = imx_dev_clk_hw_gate(dev, hw->name, hw->parents,
         |          ^
   drivers/clk/imx/clk-blk-ctrl.c:152:12: error: implicit declaration of function 'imx_dev_clk_hw_gate_shared'; did you mean 'imx_clk_hw_gate2_shared'? [-Werror=implicit-function-declaration]
     152 |   clk_hw = imx_dev_clk_hw_gate_shared(dev, hw->name,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |            imx_clk_hw_gate2_shared
   drivers/clk/imx/clk-blk-ctrl.c:152:10: warning: assignment to 'struct clk_hw *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     152 |   clk_hw = imx_dev_clk_hw_gate_shared(dev, hw->name,
         |          ^
   At top level:
>> drivers/clk/imx/clk-blk-ctrl.c:305:34: warning: 'imx_blk_ctrl_of_match' defined but not used [-Wunused-const-variable=]
     305 | static const struct of_device_id imx_blk_ctrl_of_match[] = {
         |                                  ^~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/imx_blk_ctrl_of_match +305 drivers/clk/imx/clk-blk-ctrl.c

    97	
    98	static int imx_blk_ctrl_register_reset_controller(struct device *dev)
    99	{
   100		struct imx_blk_ctrl_drvdata *drvdata = dev_get_drvdata(dev);
   101		const struct imx_blk_ctrl_dev_data *dev_data = of_device_get_match_data(dev);
   102		struct reset_hw *hws;
   103		int max = dev_data->resets_max;
   104		int i;
   105	
   106		spin_lock_init(&drvdata->lock);
   107	
   108		drvdata->rcdev.owner     = THIS_MODULE;
   109		drvdata->rcdev.nr_resets = max;
   110		drvdata->rcdev.ops       = &imx_blk_ctrl_reset_ops;
   111		drvdata->rcdev.of_node   = dev->of_node;
   112		drvdata->rcdev.dev	 = dev;
   113	
   114		drvdata->rst_hws = devm_kzalloc(dev, sizeof(struct reset_hw) * max,
   115						GFP_KERNEL);
   116		hws = drvdata->rst_hws;
   117	
   118		for (i = 0; i < dev_data->hws_num; i++) {
   119			struct imx_blk_ctrl_hw *hw = &dev_data->hws[i];
   120	
   121			if (hw->type != BLK_CTRL_RESET)
   122				continue;
   123	
   124			hws[hw->id].offset = hw->offset;
   125			hws[hw->id].shift = hw->shift;
   126			hws[hw->id].mask = hw->mask;
   127		}
   128	
   129		return devm_reset_controller_register(dev, &drvdata->rcdev);
   130	}
   131	static struct clk_hw *imx_blk_ctrl_register_one_clock(struct device *dev,
   132							struct imx_blk_ctrl_hw *hw)
   133	{
   134		struct imx_blk_ctrl_drvdata *drvdata = dev_get_drvdata(dev);
   135		void __iomem *base = drvdata->base;
   136		struct clk_hw *clk_hw;
   137	
   138		switch (hw->type) {
   139		case BLK_CTRL_CLK_MUX:
   140			clk_hw = imx_dev_clk_hw_mux_flags(dev, hw->name,
   141							  base + hw->offset,
   142							  hw->shift, hw->width,
   143							  hw->parents,
   144							  hw->parents_count,
   145							  hw->flags);
   146			break;
   147		case BLK_CTRL_CLK_GATE:
   148			clk_hw = imx_dev_clk_hw_gate(dev, hw->name, hw->parents,
   149						     base + hw->offset, hw->shift);
   150			break;
   151		case BLK_CTRL_CLK_SHARED_GATE:
 > 152			clk_hw = imx_dev_clk_hw_gate_shared(dev, hw->name,
   153							    hw->parents,
   154							    base + hw->offset,
   155							    hw->shift,
   156							    hw->shared_count);
   157			break;
   158		case BLK_CTRL_CLK_PLL14XX:
   159			clk_hw = imx_dev_clk_hw_pll14xx(dev, hw->name, hw->parents,
   160							base + hw->offset, hw->pll_tbl);
   161			break;
   162		default:
   163			clk_hw = NULL;
   164		};
   165	
   166		return clk_hw;
   167	}
   168	
   169	static int imx_blk_ctrl_register_clock_controller(struct device *dev)
   170	{
   171		const struct imx_blk_ctrl_dev_data *dev_data = of_device_get_match_data(dev);
   172		struct clk_hw_onecell_data *clk_hw_data;
   173		struct clk_hw **hws;
   174		int i;
   175	
   176		clk_hw_data = devm_kzalloc(dev, struct_size(clk_hw_data, hws,
   177					dev_data->hws_num), GFP_KERNEL);
   178		if (WARN_ON(!clk_hw_data))
   179			return -ENOMEM;
   180	
   181		clk_hw_data->num = dev_data->clocks_max;
   182		hws = clk_hw_data->hws;
   183	
   184		for (i = 0; i < dev_data->hws_num; i++) {
   185			struct imx_blk_ctrl_hw *hw = &dev_data->hws[i];
   186			struct clk_hw *tmp = imx_blk_ctrl_register_one_clock(dev, hw);
   187	
   188			if (!tmp)
   189				continue;
   190			hws[hw->id] = tmp;
   191		}
   192	
   193		imx_check_clk_hws(hws, dev_data->clocks_max);
   194	
   195		return of_clk_add_hw_provider(dev->of_node, of_clk_hw_onecell_get,
   196						clk_hw_data);
   197	}
   198	
   199	static int imx_blk_ctrl_init_runtime_pm_safekeeping(struct device *dev)
   200	{
   201		const struct imx_blk_ctrl_dev_data *dev_data = of_device_get_match_data(dev);
   202		struct imx_blk_ctrl_drvdata *drvdata = dev_get_drvdata(dev);
   203		struct pm_safekeep_info *pm_info = &drvdata->pm_info;
   204		u32 regs_num = dev_data->pm_runtime_saved_regs_num;
   205		const u32 *regs_offsets = dev_data->pm_runtime_saved_regs;
   206	
   207		if (!dev_data->pm_runtime_saved_regs_num)
   208			return 0;
   209	
   210		pm_info->regs_values = devm_kzalloc(dev,
   211						    sizeof(u32) * regs_num,
   212						    GFP_KERNEL);
   213		if (WARN_ON(IS_ERR(pm_info->regs_values)))
   214			return PTR_ERR(pm_info->regs_values);
   215	
   216		pm_info->regs_offsets = kmemdup(regs_offsets,
   217						regs_num * sizeof(u32), GFP_KERNEL);
   218		if (WARN_ON(IS_ERR(pm_info->regs_offsets)))
   219			return PTR_ERR(pm_info->regs_offsets);
   220	
   221		pm_info->regs_num = regs_num;
   222	
   223		return 0;
   224	}
   225	
   226	static int imx_blk_ctrl_probe(struct platform_device *pdev)
   227	{
   228		struct imx_blk_ctrl_drvdata *drvdata;
   229		struct device *dev = &pdev->dev;
   230		int ret;
   231	
   232		drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
   233		if (WARN_ON(!drvdata))
   234			return -ENOMEM;
   235	
   236		drvdata->base = devm_platform_ioremap_resource(pdev, 0);
   237		if (WARN_ON(IS_ERR(drvdata->base)))
   238			return PTR_ERR(drvdata->base);
   239	
   240		dev_set_drvdata(dev, drvdata);
   241	
   242		ret = imx_blk_ctrl_init_runtime_pm_safekeeping(dev);
   243		if (ret)
   244			return ret;
   245	
   246		pm_runtime_get_noresume(dev);
   247		pm_runtime_set_active(dev);
   248		pm_runtime_enable(dev);
   249	
   250		ret = imx_blk_ctrl_register_clock_controller(dev);
   251		if (ret) {
   252			pm_runtime_put(dev);
   253			return ret;
   254		}
   255	
   256		ret = imx_blk_ctrl_register_reset_controller(dev);
   257	
   258		pm_runtime_put(dev);
   259	
   260		return ret;
   261	}
   262	
   263	static void imx_blk_ctrl_read_write(struct device *dev, bool write)
   264	{
   265		struct imx_blk_ctrl_drvdata *drvdata = dev_get_drvdata(dev);
   266		struct pm_safekeep_info *pm_info = &drvdata->pm_info;
   267		void __iomem *base = drvdata->base;
   268		int i;
   269	
   270		if (!pm_info->regs_num)
   271			return;
   272	
   273		for (i = 0; i < pm_info->regs_num; i++) {
   274			u32 offset = pm_info->regs_offsets[i];
   275	
   276			if (write)
   277				writel(pm_info->regs_values[i], base + offset);
   278			else
   279				pm_info->regs_values[i] = readl(base + offset);
   280		}
   281	
   282	}
   283	
   284	static int imx_blk_ctrl_runtime_suspend(struct device *dev)
   285	{
   286		imx_blk_ctrl_read_write(dev, false);
   287	
   288		return 0;
   289	}
   290	
   291	static int imx_blk_ctrl_runtime_resume(struct device *dev)
   292	{
   293		imx_blk_ctrl_read_write(dev, true);
   294	
   295		return 0;
   296	}
   297	
   298	static const struct dev_pm_ops imx_blk_ctrl_pm_ops = {
   299		SET_RUNTIME_PM_OPS(imx_blk_ctrl_runtime_suspend,
   300				   imx_blk_ctrl_runtime_resume, NULL)
   301		SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
   302				   pm_runtime_force_resume)
   303	};
   304	
 > 305	static const struct of_device_id imx_blk_ctrl_of_match[] = {
   306	       { /* Sentinel */ }
   307	};
   308	MODULE_DEVICE_TABLE(of, imx_blk_ctrl_of_match);
   309	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
