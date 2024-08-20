Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67BAF136357
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Aug 2024 05:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724132241; cv=none; b=m/WRwINvg9gGrENXFkLxSBgABHs6Sd88QW3MmbbRo17LbSf8xn7bKGCAE0eeoyFaHluH3ojzSGePaOTs8Hiky8RiA7xRc4hHwS1Sfy1r728N8s1DUwGbXrSH/fGekmK0mQjNT0Eg50RSle2eII3eBdWan1bPD766zr0AeqWscFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724132241; c=relaxed/simple;
	bh=E/ntUHDhOqJ7ws7FwIkvha64EWf0SvHV/T/IGvO70Hg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mwQl+0IIER5e4RZ+Xyf2D/+P98DQ1iRNOH+TArso1YSxI3Ezfc7Py+/S5rwmpDO+1gYzRaFINL5jq2fSS1WdGMLAnwxc3MRHD6xU847VzYwpukPZ0H1P1qE1nsJZqMtX0WuPMaWl9kY6chbWQMW39GUs5KJhGWKL1y3yytHekQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KpI6GknL; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KpI6GknL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724132239; x=1755668239;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=E/ntUHDhOqJ7ws7FwIkvha64EWf0SvHV/T/IGvO70Hg=;
  b=KpI6GknLa1rW2XZ+NnbRVzzX5ZiVEcFI7Fworj/FwfNjzX+K6gT360Pp
   AHCSkqF8UXxEHYL2XaIy5BXdMr0p4HQIcW0AHXJ8Axb1ZT+VklT5wE7d1
   EWsAHgR3woqRyxw8tSDBE020t1NJTjxe92TLi/NJPkZ13quu+Jx963d6s
   GoVXTUM8JRxsvezG6jbZdbpg6bhMjeIfGG2RXIqpmPLrMFFpPOAKJRpyV
   BME0i5gmU8RK4mDSNF4L96K24wlfO/1V9r1qyHlTHA2qcwtNWwIeTUVKe
   Pyo4ATYYYAfnGXArnNZJ6MRGi3xg9aQUMzwjfSwE9CyVjB0T3ZPRRstvq
   g==;
X-CSE-ConnectionGUID: DeLeCVIwTJieHphnYt1R4Q==
X-CSE-MsgGUID: 7K+xc3J3R0KQbvGaV7dvGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="33793779"
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; 
   d="scan'208";a="33793779"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2024 22:37:18 -0700
X-CSE-ConnectionGUID: WH8XaG8rQlWq94GVv9axCQ==
X-CSE-MsgGUID: xI4zHew6RvOA5OQxFG/uBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; 
   d="scan'208";a="65474211"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 19 Aug 2024 22:37:18 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sgHYR-0009lO-20;
	Tue, 20 Aug 2024 05:37:15 +0000
Date: Tue, 20 Aug 2024 13:37:03 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor+lkp@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [conor:gpio-irq-6.11 17/21] drivers/irqchip/irq-mpfs-mux.c:322:58:
 warning: variable 'node' is uninitialized when used here
Message-ID: <202408201305.r28LfAhX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git gpio-irq-6.11
head:   5a0a8e4faf056acaf5203989612d17e1aad31b98
commit: f335b6d6363c29e8c0dd4d7b8acf0eaf15c0cfa9 [17/21] irqchip/mpfs-irq-mux: shift from of_iomap to regmap (TODO: squash)
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20240820/202408201305.r28LfAhX-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 26670e7fa4f032a019d23d56c6a02926e854e8af)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240820/202408201305.r28LfAhX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408201305.r28LfAhX-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/irqchip/irq-mpfs-mux.c:11:
   In file included from include/linux/interrupt.h:22:
   In file included from arch/riscv/include/asm/sections.h:9:
   In file included from include/linux/mm.h:2228:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/irqchip/irq-mpfs-mux.c:322:58: warning: variable 'node' is uninitialized when used here [-Wuninitialized]
     322 |                 priv->nondirect_irqchips[i].irq = irq_of_parse_and_map(node, irq_index);
         |                                                                        ^~~~
   drivers/irqchip/irq-mpfs-mux.c:251:26: note: initialize the variable 'node' to silence this warning
     251 |         struct device_node *node, *parent;
         |                                 ^
         |                                  = NULL
   2 warnings generated.


vim +/node +322 drivers/irqchip/irq-mpfs-mux.c

6656a8286618297 Conor Dooley 2023-05-09  248  
6656a8286618297 Conor Dooley 2023-05-09  249  static int mpfs_irq_mux_probe(struct platform_device *pdev)
6656a8286618297 Conor Dooley 2023-05-09  250  {
6656a8286618297 Conor Dooley 2023-05-09  251  	struct device_node *node, *parent;
6656a8286618297 Conor Dooley 2023-05-09  252  	struct device *dev = &pdev->dev;
6656a8286618297 Conor Dooley 2023-05-09  253  	struct mpfs_irq_mux *priv;
6656a8286618297 Conor Dooley 2023-05-09  254  	struct irq_domain *hier_domain, *parent_domain;
f335b6d6363c29e Conor Dooley 2024-08-19  255  	void __iomem *base;
f335b6d6363c29e Conor Dooley 2024-08-19  256  	int i, ret;
6656a8286618297 Conor Dooley 2023-05-09  257  
f335b6d6363c29e Conor Dooley 2024-08-19  258  	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
6656a8286618297 Conor Dooley 2023-05-09  259  	if (!priv)
6656a8286618297 Conor Dooley 2023-05-09  260  		return -ENOMEM;
6656a8286618297 Conor Dooley 2023-05-09  261  
f335b6d6363c29e Conor Dooley 2024-08-19  262  	if (!of_device_is_compatible(pdev->dev.parent->of_node, "microchip,mpfs-mss-top-sysreg"))
f335b6d6363c29e Conor Dooley 2024-08-19  263  		goto old_format;
f335b6d6363c29e Conor Dooley 2024-08-19  264  
f335b6d6363c29e Conor Dooley 2024-08-19  265  	priv->regmap = device_node_to_regmap(pdev->dev.parent->of_node);
f335b6d6363c29e Conor Dooley 2024-08-19  266  	if (IS_ERR(priv->regmap))
f335b6d6363c29e Conor Dooley 2024-08-19  267  		return PTR_ERR(priv->regmap);
f335b6d6363c29e Conor Dooley 2024-08-19  268  
f335b6d6363c29e Conor Dooley 2024-08-19  269  	priv->offset = 0x54;
f335b6d6363c29e Conor Dooley 2024-08-19  270  
f335b6d6363c29e Conor Dooley 2024-08-19  271  	goto done;
f335b6d6363c29e Conor Dooley 2024-08-19  272  
f335b6d6363c29e Conor Dooley 2024-08-19  273  old_format:
f335b6d6363c29e Conor Dooley 2024-08-19  274  	base = devm_platform_ioremap_resource(pdev, 0);
f335b6d6363c29e Conor Dooley 2024-08-19  275  	if (IS_ERR(base))
f335b6d6363c29e Conor Dooley 2024-08-19  276  		return PTR_ERR(base);
6656a8286618297 Conor Dooley 2023-05-09  277  
f335b6d6363c29e Conor Dooley 2024-08-19  278  	priv->regmap = devm_regmap_init_mmio(dev, base, &mpfs_irq_mux_regmap_config);
f335b6d6363c29e Conor Dooley 2024-08-19  279  	if (IS_ERR(priv->regmap))
f335b6d6363c29e Conor Dooley 2024-08-19  280  		return PTR_ERR(priv->regmap);
f335b6d6363c29e Conor Dooley 2024-08-19  281  
f335b6d6363c29e Conor Dooley 2024-08-19  282  	priv->offset = 0;
f335b6d6363c29e Conor Dooley 2024-08-19  283  
f335b6d6363c29e Conor Dooley 2024-08-19  284  done:
f335b6d6363c29e Conor Dooley 2024-08-19  285  	ret = regmap_read(priv->regmap, priv->offset, &priv->mux_config);
f335b6d6363c29e Conor Dooley 2024-08-19  286  	if (ret)
f335b6d6363c29e Conor Dooley 2024-08-19  287  		return ret;
6656a8286618297 Conor Dooley 2023-05-09  288  
6656a8286618297 Conor Dooley 2023-05-09  289  	for (i = 0; i < MPFS_MUX_NUM_DIRECT_IRQS; i++) {
6656a8286618297 Conor Dooley 2023-05-09  290  		struct of_phandle_args parent_irq;
6656a8286618297 Conor Dooley 2023-05-09  291  		int ret;
6656a8286618297 Conor Dooley 2023-05-09  292  
f335b6d6363c29e Conor Dooley 2024-08-19  293  		ret = of_irq_parse_one(to_of_node(dev->fwnode), i, &parent_irq);
f335b6d6363c29e Conor Dooley 2024-08-19  294  		if (ret)
f335b6d6363c29e Conor Dooley 2024-08-19  295  			return -ENODEV;
6656a8286618297 Conor Dooley 2023-05-09  296  
6656a8286618297 Conor Dooley 2023-05-09  297  		/*
6656a8286618297 Conor Dooley 2023-05-09  298  		 * The parent irqs are saved off for the first 38 interrupts
6656a8286618297 Conor Dooley 2023-05-09  299  		 * from the devicetree entry so that they can be used in the
6656a8286618297 Conor Dooley 2023-05-09  300  		 * domains alloc callback to allocate irqs from the parent irq
6656a8286618297 Conor Dooley 2023-05-09  301  		 * chip directly.
6656a8286618297 Conor Dooley 2023-05-09  302  		 */
6656a8286618297 Conor Dooley 2023-05-09  303  		priv->parent_irqs[i] = parent_irq.args[0];
6656a8286618297 Conor Dooley 2023-05-09  304  	}
6656a8286618297 Conor Dooley 2023-05-09  305  
f335b6d6363c29e Conor Dooley 2024-08-19  306  	parent = of_irq_find_parent(to_of_node(dev->fwnode));
6656a8286618297 Conor Dooley 2023-05-09  307  	parent_domain = irq_find_host(parent);
6656a8286618297 Conor Dooley 2023-05-09  308  	hier_domain = irq_domain_add_hierarchy(parent_domain, 0, MPFS_MAX_IRQS_PER_GPIO * 3,
f335b6d6363c29e Conor Dooley 2024-08-19  309  					       to_of_node(dev->fwnode), &mpfs_irq_mux_domain_ops,
f335b6d6363c29e Conor Dooley 2024-08-19  310  					       priv);
f335b6d6363c29e Conor Dooley 2024-08-19  311  	if (!hier_domain)
f335b6d6363c29e Conor Dooley 2024-08-19  312  		return dev_err_probe(dev, -ENODEV, "failed to add hierarchical domain\n");
6656a8286618297 Conor Dooley 2023-05-09  313  
6656a8286618297 Conor Dooley 2023-05-09  314  	/*
6656a8286618297 Conor Dooley 2023-05-09  315  	 * The last 3 interrupts must be the non-direct/muxed ones, per
6656a8286618297 Conor Dooley 2023-05-09  316  	 * the dt-binding.
6656a8286618297 Conor Dooley 2023-05-09  317  	 */
6656a8286618297 Conor Dooley 2023-05-09  318  	for (i = 0; i < MPFS_MUX_NUM_NON_DIRECT_IRQS; i++) {
6656a8286618297 Conor Dooley 2023-05-09  319  		int irq_index = i + MPFS_MUX_NUM_DIRECT_IRQS;
6656a8286618297 Conor Dooley 2023-05-09  320  
6656a8286618297 Conor Dooley 2023-05-09  321  		priv->nondirect_irqchips[i].bank = i;
6656a8286618297 Conor Dooley 2023-05-09 @322  		priv->nondirect_irqchips[i].irq = irq_of_parse_and_map(node, irq_index);
6656a8286618297 Conor Dooley 2023-05-09  323  		priv->nondirect_irqchips[i].offset = i * MPFS_MAX_IRQS_PER_GPIO;
6656a8286618297 Conor Dooley 2023-05-09  324  		irq_set_chained_handler_and_data(priv->nondirect_irqchips[i].irq,
6656a8286618297 Conor Dooley 2023-05-09  325  						 mpfs_irq_mux_nondirect_handler,
6656a8286618297 Conor Dooley 2023-05-09  326  						 &priv->nondirect_irqchips[i]);
6656a8286618297 Conor Dooley 2023-05-09  327  	}
6656a8286618297 Conor Dooley 2023-05-09  328  
f335b6d6363c29e Conor Dooley 2024-08-19  329  	dev_info(dev, "mux configuration %x\n", priv->mux_config);
6656a8286618297 Conor Dooley 2023-05-09  330  
6656a8286618297 Conor Dooley 2023-05-09  331  	return 0;
6656a8286618297 Conor Dooley 2023-05-09  332  }
6656a8286618297 Conor Dooley 2023-05-09  333  

:::::: The code at line 322 was first introduced by commit
:::::: 6656a828661829734a31d2a48e4d76bb1eedbf9a irqchip: add mpfs gpio interrupt mux

:::::: TO: Conor Dooley <conor.dooley@microchip.com>
:::::: CC: Conor Dooley <conor.dooley@microchip.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
