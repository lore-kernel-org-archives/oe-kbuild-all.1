Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 240D579B98
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Mar 2024 19:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709494923; cv=none; b=o0GY86rEhQ9P/zRagxFcQX4oBcePlxTsJMTSJUaaFqcb5diczFH8eGsUisV+qg7O3XsWt/TeqIXGg1EmJdyl5PYSNUQESj9vkEcY8SJsCa6lD0CdiG9IDpnBE4aLkgRYfmK+rUeHsdKItUR0VICbuEnR5OzFj1cbXxHBScGXtBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709494923; c=relaxed/simple;
	bh=M9uwZ9gQe+RdWafjUv/X0+1heN+u8hv3YAvJnWNJqbw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qj4t59PBOvEcirvUVT4s3aNZ6s5wRh/IpRuKoBJS0QfNWIwcw4VtfCZsxtgkoLyl8NaWAaJOMFMnwCPCJ5HtGFbBAMyXqg7AA09psy6VbyLFVauVwEPVbbvt18xTJXDZOFmIwaV+aBLwfKQgd/HRh7rFv7fDWrfgPM9akA//swM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=himxEv4p; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="himxEv4p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709494921; x=1741030921;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=M9uwZ9gQe+RdWafjUv/X0+1heN+u8hv3YAvJnWNJqbw=;
  b=himxEv4p5eKN/UnslYJiA/nTlI+27YXxbL8gvsyeTKRiWv907tNdAfYF
   bofYi5cUX51+iLYIO6qNP8LX/kN6pkfCMEe5sP8//1ZpQDmNz6WMpM4RX
   YJbp55tXYw4/duP6SH2SVLYY4nyK2ZoeN3xAVLQv3U4C1gWAh/GPnk/8p
   uV5ZODyiB4K1kccBLagKSTAu323/NzFIICpkS+Vegqkh6uSSYKIw9pljx
   s0vRUMLUFub8Nf0eJ4tYqY1/A4ECWmQN+O/TMtiAAH6Gppn263uWINeHH
   Tm9xkEDd2MMXle/zCyarbTgMK04TbCskEqaDtKDBoE7EaTL7xBlTD+cNX
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="14691684"
X-IronPort-AV: E=Sophos;i="6.06,201,1705392000"; 
   d="scan'208";a="14691684"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2024 11:42:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,201,1705392000"; 
   d="scan'208";a="8655997"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 03 Mar 2024 11:41:59 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rgrif-00023k-0s;
	Sun, 03 Mar 2024 19:41:57 +0000
Date: Mon, 4 Mar 2024 03:41:21 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.2.x-imx 16156/27938]
 drivers/soc/imx/imx93-blk-ctrl.c:234:35: error: 'SZ_4K' undeclared
Message-ID: <202403040321.UZH6D5DW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 5.15-2.2.x-imx
head:   d761b18f6bc83bce94251467e3c0974243318456
commit: 1c3dd14276374d48bfd2a6d41c712cd0bb04163b [16156/27938] LF-6899 soc: imx: imx93-blk-ctrl: restrict register range with access table
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240304/202403040321.UZH6D5DW-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240304/202403040321.UZH6D5DW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403040321.UZH6D5DW-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/soc/imx/imx93-blk-ctrl.c: In function 'imx93_blk_ctrl_probe':
>> drivers/soc/imx/imx93-blk-ctrl.c:234:35: error: 'SZ_4K' undeclared (first use in this function)
     234 |                 .max_register   = SZ_4K,
         |                                   ^~~~~
   drivers/soc/imx/imx93-blk-ctrl.c:234:35: note: each undeclared identifier is reported only once for each function it appears in


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
