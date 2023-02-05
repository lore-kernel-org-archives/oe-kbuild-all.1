Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C88C728E8
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Feb 2023 11:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675595329; x=1707131329;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rItfDZGxpC8jACcBAgMGEr8tqkVGVqKZR6SSCM97Q8g=;
  b=MNluoXiuPszwGPijXV+ltPp4mqspcv5iQYnLMvC2AERd85EpTRr/tyvi
   460uBko606AsEgZdCEMH/PmWlMeNrfRclCfgpCIacYhfqhyjzAhYgTzOA
   HpBzqWdhnLylTslFQMRif7YC2NREAoaufYAubO7fvV6hPmblCdqCpC6VY
   Kv5gRZnFioIUpI7FQzp2Bc47yXej70x8qdZuelFd55mX5/tWrHlMIw53p
   DGKNpdEGDE4EAIZZbjIO2hU2a7/vbuwulAVQmct5LaG6Mz2vwcJwi5WAf
   GXqjFMARF/1xg+hot6YmtFNeXfr2FboPT6yqGYOJNE8zpkf8WUPvHMHJh
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="391433484"
X-IronPort-AV: E=Sophos;i="5.97,275,1669104000"; 
   d="scan'208";a="391433484"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2023 03:08:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="994996865"
X-IronPort-AV: E=Sophos;i="5.97,275,1669104000"; 
   d="scan'208";a="994996865"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 05 Feb 2023 03:08:27 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOcsb-0001xO-0S;
	Sun, 05 Feb 2023 11:08:17 +0000
Date: Sun, 5 Feb 2023 19:07:38 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/621 16156/20208]
 drivers/soc/imx/imx93-blk-ctrl.c:234:21: error: use of undeclared identifier
 'SZ_4K'
Message-ID: <202302051916.Qypk7e4c-lkp@intel.com>
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

tree:   https://github.com/Freescale/linux-fslc pr/621
head:   b9ae52e89c61eed5d446a9693d8bf0f55a5323e7
commit: 1c3dd14276374d48bfd2a6d41c712cd0bb04163b [16156/20208] LF-6899 soc: imx: imx93-blk-ctrl: restrict register range with access table
config: hexagon-randconfig-r041-20230205 (https://download.01.org/0day-ci/archive/20230205/202302051916.Qypk7e4c-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Freescale/linux-fslc/commit/1c3dd14276374d48bfd2a6d41c712cd0bb04163b
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc pr/621
        git checkout 1c3dd14276374d48bfd2a6d41c712cd0bb04163b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/soc/imx/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

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
https://github.com/intel/lkp-tests
