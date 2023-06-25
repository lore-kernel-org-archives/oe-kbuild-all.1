Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 887E77C
	for <oe-kbuild-all@lists.linux.dev>; Sun, 25 Jun 2023 06:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687676195; x=1719212195;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hdYWcb1S6hsJbYXJTQHV30FhJOdNJ9YbwfHII31FNr8=;
  b=HjMbjHWpLHlr9uduic05+esub7C/H3KwsqylqAJQMx2SovdRSRDMLVuW
   meIrSdTe4RrL+i2OHCyRltVArSGAti1ZsTKnTWmxC/4qBfzJG4Jnyao4E
   XB0m4udUV94rxQjaokbHp86Rg5AElQG1/U52dk07DszSHcKQQM6etA7RP
   65gjEszMkdsdK5HaeQzr//+m7/Bj+3ZP16t1aYhYcieZoJnH8iC2vonvm
   Nv5SC3aJ24gJ9P/9yY1RwfBWWCJRAxsyB+WxufV9CNsXbMeychxW0QQF7
   PhHKP342c7m2UfuqB6uEmj1GNAYaULr3SRwYYQse5ChxsAnDx+BAc8Eur
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10751"; a="361070703"
X-IronPort-AV: E=Sophos;i="6.01,156,1684825200"; 
   d="scan'208";a="361070703"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2023 23:56:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10751"; a="715740150"
X-IronPort-AV: E=Sophos;i="6.01,156,1684825200"; 
   d="scan'208";a="715740150"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 24 Jun 2023 23:56:33 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qDJfk-0009qT-1X;
	Sun, 25 Jun 2023 06:56:32 +0000
Date: Sun, 25 Jun 2023 14:56:01 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-4.19 26334/26342]
 drivers/mmc/host/meson-gx-mmc.c:514:32: error: implicit declaration of
 function 'dev_err_probe'; did you mean 'device_reprobe'?
Message-ID: <202306251448.pIkuUaKN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-4.19
head:   5f0e89d38f13fd84e835d6c7ca04617367d2f1e6
commit: dfbfdf0be268f96809a73eca47c9d24c7b2e64d7 [26334/26342] mmc: meson: Simplify with dev_err_probe()
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20230625/202306251448.pIkuUaKN-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230625/202306251448.pIkuUaKN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306251448.pIkuUaKN-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/mmc/host/meson-gx-mmc.c: In function 'meson_mmc_clk_init':
>> drivers/mmc/host/meson-gx-mmc.c:514:32: error: implicit declaration of function 'dev_err_probe'; did you mean 'device_reprobe'? [-Werror=implicit-function-declaration]
     514 |                         return dev_err_probe(host->dev, PTR_ERR(clk),
         |                                ^~~~~~~~~~~~~
         |                                device_reprobe
   cc1: some warnings being treated as errors


vim +514 drivers/mmc/host/meson-gx-mmc.c

   481	
   482	/*
   483	 * The SD/eMMC IP block has an internal mux and divider used for
   484	 * generating the MMC clock.  Use the clock framework to create and
   485	 * manage these clocks.
   486	 */
   487	static int meson_mmc_clk_init(struct meson_host *host)
   488	{
   489		struct clk_init_data init;
   490		struct clk_mux *mux;
   491		struct clk_divider *div;
   492		struct meson_mmc_phase *core, *tx, *rx;
   493		struct clk *clk;
   494		char clk_name[32];
   495		int i, ret = 0;
   496		const char *mux_parent_names[MUX_CLK_NUM_PARENTS];
   497		const char *clk_parent[1];
   498		u32 clk_reg;
   499	
   500		/* init SD_EMMC_CLOCK to sane defaults w/min clock rate */
   501		clk_reg = 0;
   502		clk_reg |= CLK_ALWAYS_ON(host);
   503		clk_reg |= CLK_DIV_MASK;
   504		writel(clk_reg, host->regs + SD_EMMC_CLOCK);
   505	
   506		/* get the mux parents */
   507		for (i = 0; i < MUX_CLK_NUM_PARENTS; i++) {
   508			struct clk *clk;
   509			char name[16];
   510	
   511			snprintf(name, sizeof(name), "clkin%d", i);
   512			clk = devm_clk_get(host->dev, name);
   513			if (IS_ERR(clk))
 > 514				return dev_err_probe(host->dev, PTR_ERR(clk),
   515						     "Missing clock %s\n", name);
   516	
   517			mux_parent_names[i] = __clk_get_name(clk);
   518		}
   519	
   520		/* create the mux */
   521		mux = devm_kzalloc(host->dev, sizeof(*mux), GFP_KERNEL);
   522		if (!mux)
   523			return -ENOMEM;
   524	
   525		snprintf(clk_name, sizeof(clk_name), "%s#mux", dev_name(host->dev));
   526		init.name = clk_name;
   527		init.ops = &clk_mux_ops;
   528		init.flags = 0;
   529		init.parent_names = mux_parent_names;
   530		init.num_parents = MUX_CLK_NUM_PARENTS;
   531	
   532		mux->reg = host->regs + SD_EMMC_CLOCK;
   533		mux->shift = __ffs(CLK_SRC_MASK);
   534		mux->mask = CLK_SRC_MASK >> mux->shift;
   535		mux->hw.init = &init;
   536	
   537		clk = devm_clk_register(host->dev, &mux->hw);
   538		if (WARN_ON(IS_ERR(clk)))
   539			return PTR_ERR(clk);
   540	
   541		/* create the divider */
   542		div = devm_kzalloc(host->dev, sizeof(*div), GFP_KERNEL);
   543		if (!div)
   544			return -ENOMEM;
   545	
   546		snprintf(clk_name, sizeof(clk_name), "%s#div", dev_name(host->dev));
   547		init.name = clk_name;
   548		init.ops = &clk_divider_ops;
   549		init.flags = CLK_SET_RATE_PARENT;
   550		clk_parent[0] = __clk_get_name(clk);
   551		init.parent_names = clk_parent;
   552		init.num_parents = 1;
   553	
   554		div->reg = host->regs + SD_EMMC_CLOCK;
   555		div->shift = __ffs(CLK_DIV_MASK);
   556		div->width = __builtin_popcountl(CLK_DIV_MASK);
   557		div->hw.init = &init;
   558		div->flags = CLK_DIVIDER_ONE_BASED;
   559	
   560		clk = devm_clk_register(host->dev, &div->hw);
   561		if (WARN_ON(IS_ERR(clk)))
   562			return PTR_ERR(clk);
   563	
   564		/* create the mmc core clock */
   565		core = devm_kzalloc(host->dev, sizeof(*core), GFP_KERNEL);
   566		if (!core)
   567			return -ENOMEM;
   568	
   569		snprintf(clk_name, sizeof(clk_name), "%s#core", dev_name(host->dev));
   570		init.name = clk_name;
   571		init.ops = &meson_mmc_clk_phase_ops;
   572		init.flags = CLK_SET_RATE_PARENT;
   573		clk_parent[0] = __clk_get_name(clk);
   574		init.parent_names = clk_parent;
   575		init.num_parents = 1;
   576	
   577		core->reg = host->regs + SD_EMMC_CLOCK;
   578		core->phase_mask = CLK_CORE_PHASE_MASK;
   579		core->hw.init = &init;
   580	
   581		host->mmc_clk = devm_clk_register(host->dev, &core->hw);
   582		if (WARN_ON(PTR_ERR_OR_ZERO(host->mmc_clk)))
   583			return PTR_ERR(host->mmc_clk);
   584	
   585		/* create the mmc tx clock */
   586		tx = devm_kzalloc(host->dev, sizeof(*tx), GFP_KERNEL);
   587		if (!tx)
   588			return -ENOMEM;
   589	
   590		snprintf(clk_name, sizeof(clk_name), "%s#tx", dev_name(host->dev));
   591		init.name = clk_name;
   592		init.ops = &meson_mmc_clk_phase_ops;
   593		init.flags = 0;
   594		clk_parent[0] = __clk_get_name(host->mmc_clk);
   595		init.parent_names = clk_parent;
   596		init.num_parents = 1;
   597	
   598		tx->reg = host->regs + SD_EMMC_CLOCK;
   599		tx->phase_mask = CLK_TX_PHASE_MASK;
   600		tx->delay_mask = CLK_TX_DELAY_MASK(host);
   601		tx->delay_step_ps = CLK_DELAY_STEP_PS;
   602		tx->hw.init = &init;
   603	
   604		host->tx_clk = devm_clk_register(host->dev, &tx->hw);
   605		if (WARN_ON(PTR_ERR_OR_ZERO(host->tx_clk)))
   606			return PTR_ERR(host->tx_clk);
   607	
   608		/* create the mmc rx clock */
   609		rx = devm_kzalloc(host->dev, sizeof(*rx), GFP_KERNEL);
   610		if (!rx)
   611			return -ENOMEM;
   612	
   613		snprintf(clk_name, sizeof(clk_name), "%s#rx", dev_name(host->dev));
   614		init.name = clk_name;
   615		init.ops = &meson_mmc_clk_phase_ops;
   616		init.flags = 0;
   617		clk_parent[0] = __clk_get_name(host->mmc_clk);
   618		init.parent_names = clk_parent;
   619		init.num_parents = 1;
   620	
   621		rx->reg = host->regs + SD_EMMC_CLOCK;
   622		rx->phase_mask = CLK_RX_PHASE_MASK;
   623		rx->delay_mask = CLK_RX_DELAY_MASK(host);
   624		rx->delay_step_ps = CLK_DELAY_STEP_PS;
   625		rx->hw.init = &init;
   626	
   627		host->rx_clk = devm_clk_register(host->dev, &rx->hw);
   628		if (WARN_ON(PTR_ERR_OR_ZERO(host->rx_clk)))
   629			return PTR_ERR(host->rx_clk);
   630	
   631		/* init SD_EMMC_CLOCK to sane defaults w/min clock rate */
   632		host->mmc->f_min = clk_round_rate(host->mmc_clk, 400000);
   633		ret = clk_set_rate(host->mmc_clk, host->mmc->f_min);
   634		if (ret)
   635			return ret;
   636	
   637		/*
   638		 * Set phases : These values are mostly the datasheet recommended ones
   639		 * except for the Tx phase. Datasheet recommends 180 but some cards
   640		 * fail at initialisation with it. 270 works just fine, it fixes these
   641		 * initialisation issues and enable eMMC DDR52 mode.
   642		 */
   643		clk_set_phase(host->mmc_clk, 180);
   644		clk_set_phase(host->tx_clk, 270);
   645		clk_set_phase(host->rx_clk, 0);
   646	
   647		return clk_prepare_enable(host->mmc_clk);
   648	}
   649	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
