Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 857B97F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Aug 2023 20:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692909497; x=1724445497;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NT/0hDjQjMAIMQM8g42R7E/PqC+1ZY8uNNzJfa+GsWM=;
  b=FQ5WP7WoAFKQREOdIZR2m8hUFtFm2s9L8LLcJrlfqjDx0WsyreYjuLXO
   hKl8d19lDTz5guyQIdFzOuTZdjRIQwgkDm8hI8uz+kjRZKo6qPQh/pHW5
   qdBFwr3c3NzugLD/zlU6hq0IiuIBxnu2+cfBVgwgSUoJDkAnICGZohlJZ
   UM6uh43J1oUchNbzZOEAGIe59yhP4ivGrsYuKR0VSzhsLep2ZFC4SF8YF
   3iU68f+/IoZIIh/gwbFaoWLh/jboVZ9YgLk53ko2dkfKZZszyeBaubF/q
   VthSnDwcVeoDNuOPAT+EsYjcUvcSzzu9UhUZ/XVbXIasy/DlZeZyrUbGq
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="364743925"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="364743925"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 13:38:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="740354207"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="740354207"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 24 Aug 2023 13:38:05 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZH5g-0002xI-38;
	Thu, 24 Aug 2023 20:38:04 +0000
Date: Fri, 25 Aug 2023 04:37:20 +0800
From: kernel test robot <lkp@intel.com>
To: Xingyu Wu <xingyu.wu@starfivetech.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [broonie-misc:asoc-6.6 33/39] sound/soc/dwc/dwc-i2s.c:908:12:
 warning: 'jh7110_i2stx0_clk_cfg' defined but not used
Message-ID: <202308250433.nhzrhYEo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/misc.git asoc-6.6
head:   a74048432fbb30e7a574747f6e1f47aef17010b0
commit: 52ea7c0543f8a39da8a6fc17a5ab36b7b58d5431 [33/39] ASoC: dwc: i2s: Add StarFive JH7110 SoC support
config: mips-randconfig-r004-20230825 (https://download.01.org/0day-ci/archive/20230825/202308250433.nhzrhYEo-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230825/202308250433.nhzrhYEo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308250433.nhzrhYEo-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/dwc/dwc-i2s.c:908:12: warning: 'jh7110_i2stx0_clk_cfg' defined but not used [-Wunused-function]
     908 | static int jh7110_i2stx0_clk_cfg(struct i2s_clk_config_data *config)
         |            ^~~~~~~~~~~~~~~~~~~~~
>> sound/soc/dwc/dwc-i2s.c:891:12: warning: 'jh7110_i2srx_crg_init' defined but not used [-Wunused-function]
     891 | static int jh7110_i2srx_crg_init(struct dw_i2s_dev *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~
>> sound/soc/dwc/dwc-i2s.c:733:12: warning: 'jh7110_i2s_crg_master_init' defined but not used [-Wunused-function]
     733 | static int jh7110_i2s_crg_master_init(struct dw_i2s_dev *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/jh7110_i2stx0_clk_cfg +908 sound/soc/dwc/dwc-i2s.c

   731	
   732	/* clocks initialization with master mode on JH7110 SoC */
 > 733	static int jh7110_i2s_crg_master_init(struct dw_i2s_dev *dev)
   734	{
   735		static struct clk_bulk_data clks[] = {
   736			{ .id = "mclk" },
   737			{ .id = "mclk_ext" },
   738			{ .id = "mclk_inner" },
   739			{ .id = "apb" },
   740			{ .id = "i2sclk" },
   741		};
   742		struct reset_control *resets = devm_reset_control_array_get_exclusive(dev->dev);
   743		int ret;
   744		struct clk *pclk;
   745		struct clk *bclk_mst;
   746		struct clk *mclk;
   747		struct clk *mclk_ext;
   748		struct clk *mclk_inner;
   749	
   750		if (IS_ERR(resets))
   751			return dev_err_probe(dev->dev, PTR_ERR(resets), "failed to get i2s resets\n");
   752	
   753		ret = clk_bulk_get(dev->dev, ARRAY_SIZE(clks), clks);
   754		if (ret)
   755			return dev_err_probe(dev->dev, ret, "failed to get i2s clocks\n");
   756	
   757		mclk = clks[0].clk;
   758		mclk_ext = clks[1].clk;
   759		mclk_inner = clks[2].clk;
   760		pclk = clks[3].clk;
   761		bclk_mst = clks[4].clk;
   762	
   763		ret = clk_prepare_enable(pclk);
   764		if (ret)
   765			goto exit;
   766	
   767		/* Use inner mclk first and avoid uninitialized gpio for external mclk */
   768		ret = clk_set_parent(mclk, mclk_inner);
   769		if (ret)
   770			goto err_dis_pclk;
   771	
   772		ret = clk_prepare_enable(bclk_mst);
   773		if (ret)
   774			goto err_dis_pclk;
   775	
   776		/* deassert resets before set clock parent */
   777		ret = reset_control_deassert(resets);
   778		if (ret)
   779			goto err_dis_all;
   780	
   781		/* external clock (12.288MHz) for Audio */
   782		ret = clk_set_parent(mclk, mclk_ext);
   783		if (ret)
   784			goto err_dis_all;
   785	
   786		/* i2sclk will be got and enabled repeatedly later and should be disabled now. */
   787		clk_disable_unprepare(bclk_mst);
   788		clk_bulk_put(ARRAY_SIZE(clks), clks);
   789		dev->is_jh7110 = true;
   790	
   791		return 0;
   792	
   793	err_dis_all:
   794		clk_disable_unprepare(bclk_mst);
   795	err_dis_pclk:
   796		clk_disable_unprepare(pclk);
   797	exit:
   798		clk_bulk_put(ARRAY_SIZE(clks), clks);
   799		return ret;
   800	}
   801	
   802	/* clocks initialization with slave mode on JH7110 SoC */
   803	static int jh7110_i2s_crg_slave_init(struct dw_i2s_dev *dev)
   804	{
   805		static struct clk_bulk_data clks[] = {
   806			{ .id = "mclk" },
   807			{ .id = "mclk_ext" },
   808			{ .id = "apb" },
   809			{ .id = "bclk_ext" },
   810			{ .id = "lrck_ext" },
   811			{ .id = "bclk" },
   812			{ .id = "lrck" },
   813			{ .id = "mclk_inner" },
   814			{ .id = "i2sclk" },
   815		};
   816		struct reset_control *resets = devm_reset_control_array_get_exclusive(dev->dev);
   817		int ret;
   818		struct clk *pclk;
   819		struct clk *bclk_mst;
   820		struct clk *bclk_ext;
   821		struct clk *lrck_ext;
   822		struct clk *bclk;
   823		struct clk *lrck;
   824		struct clk *mclk;
   825		struct clk *mclk_ext;
   826		struct clk *mclk_inner;
   827	
   828		if (IS_ERR(resets))
   829			return dev_err_probe(dev->dev, PTR_ERR(resets), "failed to get i2s resets\n");
   830	
   831		ret = clk_bulk_get(dev->dev, ARRAY_SIZE(clks), clks);
   832		if (ret)
   833			return dev_err_probe(dev->dev, ret, "failed to get i2s clocks\n");
   834	
   835		mclk = clks[0].clk;
   836		mclk_ext = clks[1].clk;
   837		pclk = clks[2].clk;
   838		bclk_ext = clks[3].clk;
   839		lrck_ext = clks[4].clk;
   840		bclk = clks[5].clk;
   841		lrck = clks[6].clk;
   842		mclk_inner = clks[7].clk;
   843		bclk_mst = clks[8].clk;
   844	
   845		ret = clk_prepare_enable(pclk);
   846		if (ret)
   847			goto exit;
   848	
   849		ret = clk_set_parent(mclk, mclk_inner);
   850		if (ret)
   851			goto err_dis_pclk;
   852	
   853		ret = clk_prepare_enable(bclk_mst);
   854		if (ret)
   855			goto err_dis_pclk;
   856	
   857		ret = reset_control_deassert(resets);
   858		if (ret)
   859			goto err_dis_all;
   860	
   861		/* The sources of BCLK and LRCK are the external codec. */
   862		ret = clk_set_parent(bclk, bclk_ext);
   863		if (ret)
   864			goto err_dis_all;
   865	
   866		ret = clk_set_parent(lrck, lrck_ext);
   867		if (ret)
   868			goto err_dis_all;
   869	
   870		ret = clk_set_parent(mclk, mclk_ext);
   871		if (ret)
   872			goto err_dis_all;
   873	
   874		/* The i2sclk will be got and enabled repeatedly later and should be disabled now. */
   875		clk_disable_unprepare(bclk_mst);
   876		clk_bulk_put(ARRAY_SIZE(clks), clks);
   877		dev->is_jh7110 = true;
   878	
   879		return 0;
   880	
   881	err_dis_all:
   882		clk_disable_unprepare(bclk_mst);
   883	err_dis_pclk:
   884		clk_disable_unprepare(pclk);
   885	exit:
   886		clk_bulk_put(ARRAY_SIZE(clks), clks);
   887		return ret;
   888	}
   889	
   890	/* Special syscon initialization about RX channel with slave mode on JH7110 SoC */
 > 891	static int jh7110_i2srx_crg_init(struct dw_i2s_dev *dev)
   892	{
   893		struct regmap *regmap;
   894		unsigned int args[2];
   895	
   896		regmap = syscon_regmap_lookup_by_phandle_args(dev->dev->of_node,
   897							      "starfive,syscon",
   898							      2, args);
   899		if (IS_ERR(regmap))
   900			return dev_err_probe(dev->dev, PTR_ERR(regmap), "getting the regmap failed\n");
   901	
   902		/* Enable I2Srx with syscon register, args[0]: offset, args[1]: mask */
   903		regmap_update_bits(regmap, args[0], args[1], args[1]);
   904	
   905		return jh7110_i2s_crg_slave_init(dev);
   906	}
   907	
 > 908	static int jh7110_i2stx0_clk_cfg(struct i2s_clk_config_data *config)
   909	{
   910		struct dw_i2s_dev *dev = container_of(config, struct dw_i2s_dev, config);
   911		u32 bclk_rate = config->sample_rate * 64;
   912	
   913		return clk_set_rate(dev->clk, bclk_rate);
   914	}
   915	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
