Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B48893AA4F6
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Jul 2026 20:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785442060; cv=none; b=YxG72uNTsAS8yOGiX0gM0nBSVwO+zTltkDLXJwdh8tAJFaeTtsYoJqKpzLiAzb4MoJrw+YFpFQBKgfoHHmEkD3JT/dwieiNeo+dmO5jwiJue099jlh1vIEOVhwBIgGZL7yWPBNruncg4vYUm5XtdumSxN8U04lJQKZuPTlIx998=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785442060; c=relaxed/simple;
	bh=9uC9BD2GWypXXN5h15B2iPwuwpKGWQMg7GRtVkTznCs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NIRBIdGDezcncZdjF/RT0iedcO7YbsTsRJbbCY7Co0rawn5gLnaPq0ogZ+rGTsfr8bmxrRIaJwr6b1x43VZ2cmBLE2QhGjqlmufVVTcNgYKDcdf1pCVovqO/yp9B3EQ0EU9vLjhgb2ecLzdh54vRq53JGJRK7Junfcu/Mxb6AjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hS0ch0Dt; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hS0ch0Dt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785442057; x=1816978057;
  h=date:from:to:cc:subject:message-id;
  bh=9uC9BD2GWypXXN5h15B2iPwuwpKGWQMg7GRtVkTznCs=;
  b=hS0ch0Dtc6WGK4B7z27jLGi3R5ljFbapuF/Oa0CRxbMyc5zVXi5qwkuY
   Kk5fk96fUD+freY+T69sXdqO9otDXbBnSkcYu8RvahabbzlKISPkSiuLk
   xcNJRiJSCPe5+QiBQr/boTsfMx++LDwt+92l4i47UB9+t8IzyTZPYQ4j6
   KVV5DxaoRQRZUwCD3I38zRuZCQZMuyoPS6X1FaoJOYuF03Wb4HEJ47/RZ
   JdQSZ+cvCJ3PSJZo4+5lp9obwBde73uLVsIUjweQM9p6Dyl+bE5rYMyPI
   pYv4Xih9OEPQrWrb6U7ASHzQsbBO1jcX3BRl+GnHzZrPC9MnBH07WS8IH
   g==;
X-CSE-ConnectionGUID: ucgM5PI7RmWKk9g9VQllmg==
X-CSE-MsgGUID: a1m81I/vSPGFuJMp/sh81A==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="89750748"
X-IronPort-AV: E=Sophos;i="6.25,195,1779174000"; 
   d="scan'208";a="89750748"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 13:07:37 -0700
X-CSE-ConnectionGUID: n1030R0ZTlKkwH3dU0Z6nw==
X-CSE-MsgGUID: F1m0t4B4QZet3QVxB+4Chw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,195,1779174000"; 
   d="scan'208";a="257712074"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 30 Jul 2026 13:07:35 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpX2S-00000000hY9-1o3e;
	Thu, 30 Jul 2026 20:07:32 +0000
Date: Fri, 31 Jul 2026 04:07:06 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Palmer <daniel@0x0f.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chenxing:mstar_v6_5_reorder 3/700]
 drivers/clk/mstar/clk-msc313-upll.c:73:25: warning: unused variable
 'numrates'
Message-ID: <202607310429.jLdocPDb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/linux-chenxing/linux.git mstar_v6_5_reorder
head:   1a5c60e65ea399670a5384b869c4958338af2799
commit: d2e2a3c660a4dfe32fe20cbe346161abac9b32da [3/700] clk: mstar: upll
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260731/202607310429.jLdocPDb-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260731/202607310429.jLdocPDb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607310429.jLdocPDb-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/clk/mstar/clk-msc313-upll.c: In function 'mstar_pll_common_probe':
>> drivers/clk/mstar/clk-msc313-upll.c:73:25: warning: unused variable 'numrates' [-Wunused-variable]
      73 |         int numparents, numrates, pllindex;
         |                         ^~~~~~~~
>> drivers/clk/mstar/clk-msc313-upll.c:73:13: warning: variable 'numparents' set but not used [-Wunused-but-set-variable]
      73 |         int numparents, numrates, pllindex;
         |             ^~~~~~~~~~
   At top level:
>> drivers/clk/mstar/clk-msc313-upll.c:36:31: warning: 'en_clk_upll_192m_field' defined but not used [-Wunused-const-variable=]
      36 | static const struct reg_field en_clk_upll_192m_field = REG_FIELD(REG_EN_PWRDN, 2, 2);
         |                               ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/clk/mstar/clk-msc313-upll.c:35:31: warning: 'upll_en_prdt2' defined but not used [-Wunused-const-variable=]
      35 | static const struct reg_field upll_en_prdt2 = REG_FIELD(REG_EN_PWRDN, 1, 1);
         |                               ^~~~~~~~~~~~~
>> drivers/clk/mstar/clk-msc313-upll.c:34:31: warning: 'clk0_upll_384_en_field' defined but not used [-Wunused-const-variable=]
      34 | static const struct reg_field clk0_upll_384_en_field = REG_FIELD(REG_EN_PWRDN, 0, 0);
         |                               ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/clk/mstar/clk-msc313-upll.c:33:31: warning: 'enxtal_field' defined but not used [-Wunused-const-variable=]
      33 | static const struct reg_field enxtal_field = REG_FIELD(REG_MAGIC, 7, 7);
         |                               ^~~~~~~~~~~~
>> drivers/clk/mstar/clk-msc313-upll.c:32:31: warning: 'enfrun_field' defined but not used [-Wunused-const-variable=]
      32 | static const struct reg_field enfrun_field = REG_FIELD(REG_MAGIC, 5, 5);
         |                               ^~~~~~~~~~~~
>> drivers/clk/mstar/clk-msc313-upll.c:31:31: warning: 'enddisc_field' defined but not used [-Wunused-const-variable=]
      31 | static const struct reg_field enddisc_field = REG_FIELD(REG_MAGIC, 4, 4);
         |                               ^~~~~~~~~~~~~


vim +/numrates +73 drivers/clk/mstar/clk-msc313-upll.c

    27	
    28	
    29	/* based on the comments from the upll powerdown code in the i2m sdk kernel */
    30	static const struct reg_field pd_field = REG_FIELD(REG_MAGIC, 1, 1);
  > 31	static const struct reg_field enddisc_field = REG_FIELD(REG_MAGIC, 4, 4);
  > 32	static const struct reg_field enfrun_field = REG_FIELD(REG_MAGIC, 5, 5);
  > 33	static const struct reg_field enxtal_field = REG_FIELD(REG_MAGIC, 7, 7);
  > 34	static const struct reg_field clk0_upll_384_en_field = REG_FIELD(REG_EN_PWRDN, 0, 0);
  > 35	static const struct reg_field upll_en_prdt2 = REG_FIELD(REG_EN_PWRDN, 1, 1);
  > 36	static const struct reg_field en_clk_upll_192m_field = REG_FIELD(REG_EN_PWRDN, 2, 2);
    37	static const struct reg_field ctrl_pd_clk0_audio_field = REG_FIELD(REG_EN_PWRDN, 3, 3);
    38	
    39	static const char* msc313_upll_outputs[] = {
    40		"384",
    41		"320",
    42	};
    43	static const u32 msc313_upll_output_rates[] = {
    44		384000000,
    45		320000000,
    46	};
    47	
    48	struct mstar_pll_output {
    49		struct mstar_upll *pll;
    50		u32 rate;
    51		struct clk_hw clk_hw;
    52	};
    53	
    54	struct mstar_upll {
    55		void __iomem *base;
    56		struct clk_onecell_data clk_data;
    57		struct mstar_pll_output *outputs;
    58		unsigned numoutputs;
    59	
    60		struct regmap_field *pd;
    61		struct regmap_field *pd_clk0_audio;
    62	};
    63	
    64	#define to_pll_output(_hw) container_of(_hw, struct mstar_pll_output, clk_hw)
    65	
    66	static int mstar_pll_common_probe(struct platform_device *pdev, struct mstar_upll **pll,
    67			const struct clk_ops *clk_ops)
    68	{
    69		struct device *dev = &pdev->dev;
    70		struct mstar_pll_output* output;
    71		struct clk_init_data clk_init = { };
    72		struct clk* clk;
  > 73		int numparents, numrates, pllindex;
    74		struct clk_onecell_data *clk_data;
    75		const char *parents[1];
    76		int numoutputs = ARRAY_SIZE(msc313_upll_outputs);
    77	
    78		numparents = of_clk_parent_fill(pdev->dev.of_node, parents, ARRAY_SIZE(parents));
    79	
    80		*pll = devm_kzalloc(&pdev->dev, sizeof(**pll), GFP_KERNEL);
    81		(*pll)->outputs = devm_kzalloc(&pdev->dev, sizeof((*pll)->outputs) * numoutputs, GFP_KERNEL);
    82		if (!(*pll)->outputs)
    83			return -ENOMEM;
    84	
    85		(*pll)->base = devm_platform_ioremap_resource(pdev, 0);
    86		if (IS_ERR((*pll)->base))
    87			return PTR_ERR((*pll)->base);
    88	
    89		clk_data = &(*pll)->clk_data;
    90		clk_data->clk_num = numoutputs;
    91		clk_data->clks = devm_kcalloc(&pdev->dev, numoutputs, sizeof(struct clk *), GFP_KERNEL);
    92		if (!clk_data->clks)
    93			return -ENOMEM;
    94	
    95		for (pllindex = 0; pllindex < numoutputs; pllindex++) {
    96			output = &(*pll)->outputs[pllindex];
    97			output->pll = *pll;
    98	
    99			output->clk_hw.init = &clk_init;
   100			clk_init.name = devm_kasprintf(dev, GFP_KERNEL, "%s_%s",
   101					dev_name(dev), msc313_upll_outputs[pllindex]);
   102			clk_init.ops = clk_ops;
   103			clk_init.num_parents = 1;
   104			clk_init.parent_names = parents;
   105	
   106			output->rate = msc313_upll_output_rates[pllindex];
   107	
   108			clk = clk_register(&pdev->dev, &output->clk_hw);
   109			if (IS_ERR(clk)) {
   110				printk("failed to register clk");
   111				return -ENOMEM;
   112			}
   113			clk_data->clks[pllindex] = clk;
   114		}
   115	
   116		return of_clk_add_provider(pdev->dev.of_node, of_clk_src_onecell_get, clk_data);
   117	}
   118	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
