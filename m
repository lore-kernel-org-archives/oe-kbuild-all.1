Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB6B36AF2
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 Apr 2024 02:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714184604; cv=none; b=B/BMyqOfNVWbsE4bRnSykqnzm46uD4yFE6lnj/pkMd+DO4ipbEyknZEjJWWMWu9fAEn/L8nHQbvo0wP32ufGcJRRN8h9hoF8G6cgQUFJKfT6Xf6Y6dcC/RJVQnRlir8Z1OiCf9uZYUwyuKcW7ucBjysI/Z5huh3gkBg050Ii/UI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714184604; c=relaxed/simple;
	bh=Y/8tSQa4L8fQScZYJUn2+w4XsikGAwkznsWC/inr/3c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O4z7ZlTM/iW+ACPeBZConm7UtmS7w2L8dv0BEqGPW+5lbbTRfZwnSfccchf+JMcbeMB8/48j6wnvHBBFts6ANcinnIXRoV8/T/tD84dd/N5bIPArhvBRiihA5B5dw0fTXWh08Vu0Ed1v2a2Em1suLBALjfpWRlbN6wPh6G3SnxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VjCShcWc; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VjCShcWc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714184602; x=1745720602;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Y/8tSQa4L8fQScZYJUn2+w4XsikGAwkznsWC/inr/3c=;
  b=VjCShcWcXtii8udg5ar/VJjSRTbxrGvh5WLnRaEnprkURIZD/N+ba3pS
   vZUvz7HUQP/kCiyrsPA3uaCFHTAV2nUeWHqGG5Qk+NePK3vUS5HdpQb0H
   h3VX70RUniR6Z5qFjAEXM++Hf4wEhAdGNzz3gL6k1xbZ4Nh3NJFF3nqXY
   Rm0BY73X36zroGnGR/f3493p+GvWjSMHjHmYsKE+2Y4jp1WyotTlE5wqE
   vJnxebmLU+FCsr5p6PwRmzigQFjfVXoOxS0uHse5ngJeB2jJzyfhe9gEt
   SFgj531NTeyHjlc9e22m1FBOScgnd4kvmc6XXxLMFPhd05uANGOb8UCqr
   g==;
X-CSE-ConnectionGUID: 9DMMu9tGTG+hR54K0J9rwg==
X-CSE-MsgGUID: /seXx/WcTn6A+2OadYHE7A==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="10096608"
X-IronPort-AV: E=Sophos;i="6.07,234,1708416000"; 
   d="scan'208";a="10096608"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 19:23:22 -0700
X-CSE-ConnectionGUID: TEIu0DSTTHykNW7cACihyA==
X-CSE-MsgGUID: DMpEaZHNRzuyl86p92Pg1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,234,1708416000"; 
   d="scan'208";a="30242472"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 26 Apr 2024 19:23:21 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s0Xig-0004Zk-22;
	Sat, 27 Apr 2024 02:23:18 +0000
Date: Sat, 27 Apr 2024 10:22:53 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.2.x-imx 16156/29910]
 drivers/soc/imx/imx93-blk-ctrl.c:234:21: error: use of undeclared identifier
 'SZ_4K'
Message-ID: <202404271044.0mQkXcG1-lkp@intel.com>
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

tree:   https://github.com/Freescale/linux-fslc 5.15-2.2.x-imx
head:   ebcdbe7ec49f9c3405ee4b89e7ec279e313026f3
commit: 1c3dd14276374d48bfd2a6d41c712cd0bb04163b [16156/29910] LF-6899 soc: imx: imx93-blk-ctrl: restrict register range with access table
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20240427/202404271044.0mQkXcG1-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 5ef5eb66fb428aaf61fb51b709f065c069c11242)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240427/202404271044.0mQkXcG1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404271044.0mQkXcG1-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/soc/imx/imx93-blk-ctrl.c:234:21: error: use of undeclared identifier 'SZ_4K'
     234 |                 .max_register   = SZ_4K,
         |                                   ^
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
