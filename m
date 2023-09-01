Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D5DDBE6E
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Sep 2023 14:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693576908; x=1725112908;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5UhyxkWjdMOmhaa5rVyO92F7Uc/G8xhH2+DvLte7iZY=;
  b=Fl1t/y/z8dPKW63bhoaU55zXOeXT8w2I/MGgcdr41RqizHZ0JgqZbrV5
   hFIXK1aSE+BHzOhGBaRRvIXfqfiRTQEs8hc3Gha4sAKxA/exY/jMDpQAd
   03JNFGuagDPp9NqePcP1TiVIcwEUjG1YQTTHuWBGHWOllIAx+ZF+wosmb
   7ihosbVbipJEZDNiwrDzi2y1h332WOeS6DFlgktzU27OEd295CUfNCjHo
   TCrMlc6tWTZeGtrx+i8D3mbTvz0eFLzGCJ7Mqxg9CZwKbVNexU3vocYwM
   EJq+ef0CcdqCOpiVcv1BwMLIrxn/SjrYz0Rk1yJK6m7+gkv+tVjxxyQti
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="361250279"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; 
   d="scan'208";a="361250279"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2023 07:01:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="733535898"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; 
   d="scan'208";a="733535898"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 01 Sep 2023 07:01:40 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qc4iQ-0001LT-0l;
	Fri, 01 Sep 2023 14:01:38 +0000
Date: Fri, 1 Sep 2023 22:01:37 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/639 16156/24603]
 drivers/soc/imx/imx93-blk-ctrl.c:234:21: error: use of undeclared identifier
 'SZ_4K'
Message-ID: <202309012150.6e5zCcI0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Peng,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc pr/639
head:   857fbf7cebaba3b1ffccc558deee1d13ac0e11d7
commit: 1c3dd14276374d48bfd2a6d41c712cd0bb04163b [16156/24603] LF-6899 soc: imx: imx93-blk-ctrl: restrict register range with access table
config: hexagon-randconfig-001-20230831 (https://download.01.org/0day-ci/archive/20230901/202309012150.6e5zCcI0-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230901/202309012150.6e5zCcI0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309012150.6e5zCcI0-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/soc/imx/imx93-blk-ctrl.c:234:21: error: use of undeclared identifier 'SZ_4K'
                   .max_register   = SZ_4K,
                                     ^
   1 error generated.


vim +/SZ_4K +234 drivers/soc/imx/imx93-blk-ctrl.c

   218	
   219	static int imx93_blk_ctrl_probe(struct platform_device *pdev)
   220	{
   221		struct device *dev = &pdev->dev;
   222		const struct imx93_blk_ctrl_data *bc_data = of_device_get_match_data(dev);
   223		const struct imx93_blk_ctrl_domain_data *bus = bc_data->bus;
   224		struct imx93_blk_ctrl *bc;
   225		void __iomem *base;
   226		int i, ret;
   227	
   228		struct regmap_config regmap_config = {
   229			.reg_bits	= 32,
   230			.val_bits	= 32,
   231			.reg_stride	= 4,
   232			.rd_table	= bus->reg_access_table,
   233			.wr_table	= bus->reg_access_table,
 > 234			.max_register   = SZ_4K,
   235		};
   236	
   237		bc = devm_kzalloc(dev, sizeof(*bc), GFP_KERNEL);
   238		if (!bc)
   239			return -ENOMEM;
   240	
   241		bc->dev = dev;
   242	
   243		base = devm_platform_ioremap_resource(pdev, 0);
   244		if (IS_ERR(base))
   245			return PTR_ERR(base);
   246	
   247		bc->regmap = devm_regmap_init_mmio(dev, base, &regmap_config);
   248		if (IS_ERR(bc->regmap))
   249			return dev_err_probe(dev, PTR_ERR(bc->regmap),
   250					     "failed to init regmap\n");
   251	
   252		bc->domains = devm_kcalloc(dev, bc_data->num_domains + 1,
   253					   sizeof(struct imx93_blk_ctrl_domain),
   254					   GFP_KERNEL);
   255		if (!bc->domains)
   256			return -ENOMEM;
   257	
   258		bc->onecell_data.num_domains = bc_data->num_domains;
   259		bc->onecell_data.xlate = imx93_blk_ctrl_xlate;
   260		bc->onecell_data.domains =
   261			devm_kcalloc(dev, bc_data->num_domains,
   262				     sizeof(struct generic_pm_domain *), GFP_KERNEL);
   263		if (!bc->onecell_data.domains)
   264			return -ENOMEM;
   265	
   266		for (i = 0; i < bus->num_clks; i++)
   267			bc->clks[i].id = bus->clk_names[i];
   268		bc->num_clks = bus->num_clks;
   269	
   270		ret = devm_clk_bulk_get(dev, bc->num_clks, bc->clks);
   271		if (ret) {
   272			dev_err_probe(dev, ret, "failed to get bus clock\n");
   273			return ret;
   274		}
   275	
   276		for (i = 0; i < bc_data->num_domains; i++) {
   277			const struct imx93_blk_ctrl_domain_data *data = &bc_data->domains[i];
   278			struct imx93_blk_ctrl_domain *domain = &bc->domains[i];
   279			int j;
   280	
   281			domain->data = data;
   282	
   283			for (j = 0; j < data->num_clks; j++)
   284				domain->clks[j].id = data->clk_names[j];
   285	
   286			ret = devm_clk_bulk_get(dev, data->num_clks, domain->clks);
   287			if (ret) {
   288				dev_err_probe(dev, ret, "failed to get clock\n");
   289				goto cleanup_pds;
   290			}
   291	
   292			domain->genpd.name = data->name;
   293			domain->genpd.power_on = imx93_blk_ctrl_power_on;
   294			domain->genpd.power_off = imx93_blk_ctrl_power_off;
   295			domain->bc = bc;
   296	
   297			ret = pm_genpd_init(&domain->genpd, NULL, true);
   298			if (ret) {
   299				dev_err_probe(dev, ret, "failed to init power domain\n");
   300				goto cleanup_pds;
   301			}
   302	
   303			bc->onecell_data.domains[i] = &domain->genpd;
   304		}
   305	
   306		pm_runtime_enable(dev);
   307	
   308		ret = of_genpd_add_provider_onecell(dev->of_node, &bc->onecell_data);
   309		if (ret) {
   310			dev_err_probe(dev, ret, "failed to add power domain provider\n");
   311			goto cleanup_pds;
   312		}
   313	
   314	
   315		dev_set_drvdata(dev, bc);
   316	
   317		return 0;
   318	
   319	cleanup_pds:
   320		for (i--; i >= 0; i--)
   321			pm_genpd_remove(&bc->domains[i].genpd);
   322	
   323		return ret;
   324	}
   325	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
