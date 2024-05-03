Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2102357C8A
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 May 2024 18:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714762372; cv=none; b=kZDtnBf3H+NXWdktBjw8aY2aAmRSbTiNVOU77inqihNbK4IoeXiv/8ZviFDnyY6tuylkjVpRf5cNY2EfUTzorQj5gw4dx8gHe/NL55gucYvOp3QdOWpfFYn3r8a/UYKoE0i80BVGxCUCVmSq03uXUTUdGWXI55A7679SivB1ne4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714762372; c=relaxed/simple;
	bh=uXapI8RVwYICsRZzivqR9GC0ULGuoUmNEa+xEgROIeo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iR5B5tKPuj7tA8L1oeP5PZQ7TMhavidoj53m2uovcxwnkjftrukcDhrKiQPXCDlMjIsY5jERNDfhUsVhLq9XVso965Qv9VK+I2zgxiSE33sJzKWgkPxOXe9ZbrT8pDYu2En0lb/jTUI+bwvFNu/cSBhQ+TPCP5920jHPBXsmmnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Isck+jE+; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Isck+jE+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714762370; x=1746298370;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uXapI8RVwYICsRZzivqR9GC0ULGuoUmNEa+xEgROIeo=;
  b=Isck+jE+azyvC4bvqz5tKdUMLfX+FIQZihmN7klmn3S9/HJQ5Gx/T4xe
   0hkm6efzKfsyYslpc+SVlT3a0e7E+fseiMW02X1fQOqsA44FRHgfmhQBO
   jyiiARAW4ULnySL+CzgDMnonyWHEC92Yx9CTmFvU3h7zznzkShc+MUU8R
   Euk2ivEYHkGhvdXelil/2mc4VxDSLOK0oBqqhj4EJ2IQYTknuFqH6of5C
   9PbgY87ztad31wYpv7ETOMTOETSSO5JOE7VlenEkepxKv1J7//x2uUEv7
   tAYs8ScQaS3jICMl4LXXLmBI1M6axF1gEZ64r4MIKhncf1NrjAbPDJ1Of
   g==;
X-CSE-ConnectionGUID: RL0j4HNNR4WxYPJuYZvQfw==
X-CSE-MsgGUID: Xq5JVb93Sc+UiyhRwrdk0g==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="28058261"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="28058261"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2024 11:52:49 -0700
X-CSE-ConnectionGUID: yBiXV48HSBqV318uzomxXg==
X-CSE-MsgGUID: FjVqve7UTNm2PIb8+wkF2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="27618048"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 03 May 2024 11:52:47 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s2y1V-000C1Q-1j;
	Fri, 03 May 2024 18:52:45 +0000
Date: Sat, 4 May 2024 02:51:55 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Stanley <joel@jms.id.au>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [shenki:aspeed-6.9-rebase 837/1143]
 drivers/clk/clk-ast1700.c:301:18: warning: assignment to 'struct
 clk_hw_onecell_data *' from 'int' makes pointer from integer without a cast
Message-ID: <202405040229.IvBAZiRj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/shenki/linux aspeed-6.9-rebase
head:   9bdcee91eb5d9149678acb9d066e9dafbd026721
commit: 0aa1636db6c7f4fd171086faf5857fb18b78b6ad [837/1143] clk: ast1700 add reset.
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240504/202405040229.IvBAZiRj-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240504/202405040229.IvBAZiRj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405040229.IvBAZiRj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/clk/clk-ast1700.c:113:16: warning: no previous prototype for 'AST1700_calc_pll' [-Wmissing-prototypes]
     113 | struct clk_hw *AST1700_calc_pll(const char *name, const char *parent_name, u32 val)
         |                ^~~~~~~~~~~~~~~~
   drivers/clk/clk-ast1700.c: In function 'AST1700_clk_hw_register_gate':
   drivers/clk/clk-ast1700.c:180:16: error: implicit declaration of function 'kzalloc'; did you mean 'vzalloc'? [-Werror=implicit-function-declaration]
     180 |         gate = kzalloc(sizeof(*gate), GFP_KERNEL);
         |                ^~~~~~~
         |                vzalloc
   drivers/clk/clk-ast1700.c:180:14: warning: assignment to 'struct clk_gate *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     180 |         gate = kzalloc(sizeof(*gate), GFP_KERNEL);
         |              ^
   drivers/clk/clk-ast1700.c:199:17: error: implicit declaration of function 'kfree'; did you mean 'vfree'? [-Werror=implicit-function-declaration]
     199 |                 kfree(gate);
         |                 ^~~~~
         |                 vfree
   drivers/clk/clk-ast1700.c: In function 'AST1700_clk_init':
>> drivers/clk/clk-ast1700.c:301:18: warning: assignment to 'struct clk_hw_onecell_data *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     301 |         clk_data = kzalloc(struct_size(clk_data, hws, AST1700_NUM_CLKS), GFP_KERNEL);
         |                  ^
>> drivers/clk/clk-ast1700.c:308:15: warning: assignment to 'struct ast1700_reset *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     308 |         reset = kzalloc(sizeof(*reset), GFP_KERNEL);
         |               ^
   cc1: some warnings being treated as errors


vim +301 drivers/clk/clk-ast1700.c

   169	
   170	static struct clk_hw *AST1700_clk_hw_register_gate(struct device *dev, const char *name,
   171							   const char *parent_name, unsigned long flags,
   172							   void __iomem *reg, u8 clock_idx,
   173							   u8 clk_gate_flags, spinlock_t *lock)
   174	{
   175		struct clk_gate *gate;
   176		struct clk_hw *hw;
   177		struct clk_init_data init;
   178		int ret = -EINVAL;
   179	
 > 180		gate = kzalloc(sizeof(*gate), GFP_KERNEL);
   181		if (!gate)
   182			return ERR_PTR(-ENOMEM);
   183	
   184		init.name = name;
   185		init.ops = &AST1700_clk_gate_ops;
   186		init.flags = flags;
   187		init.parent_names = parent_name ? &parent_name : NULL;
   188		init.num_parents = parent_name ? 1 : 0;
   189	
   190		gate->reg = reg;
   191		gate->bit_idx = clock_idx;
   192		gate->flags = clk_gate_flags;
   193		gate->lock = lock;
   194		gate->hw.init = &init;
   195	
   196		hw = &gate->hw;
   197		ret = clk_hw_register(dev, hw);
   198		if (ret) {
 > 199			kfree(gate);
   200			hw = ERR_PTR(ret);
   201		}
   202	
   203		return hw;
   204	}
   205	
   206	struct ast1700_reset {
   207		void __iomem *base;
   208		struct reset_controller_dev rcdev;
   209	};
   210	
   211	#define to_rc_data(p) container_of(p, struct ast1700_reset, rcdev)
   212	
   213	static int ast1700_reset_assert(struct reset_controller_dev *rcdev, unsigned long id)
   214	{
   215		struct ast1700_reset *rc = to_rc_data(rcdev);
   216		u32 rst = BIT(id % 32);
   217		u32 reg = id >= 32 ? 0x220 : 0x200;
   218	
   219		writel(rst, rc->base + reg);
   220		return 0;
   221	}
   222	
   223	static int ast1700_reset_deassert(struct reset_controller_dev *rcdev, unsigned long id)
   224	{
   225		struct ast1700_reset *rc = to_rc_data(rcdev);
   226		u32 rst = BIT(id % 32);
   227		u32 reg = id >= 32 ? 0x220 : 0x200;
   228	
   229		/* Use set to clear register */
   230		writel(rst, rc->base + reg + 0x04);
   231		return 0;
   232	}
   233	
   234	static int ast1700_reset_status(struct reset_controller_dev *rcdev, unsigned long id)
   235	{
   236		struct ast1700_reset *rc = to_rc_data(rcdev);
   237		u32 rst = BIT(id % 32);
   238		u32 reg = id >= 32 ? 0x220 : 0x200;
   239	
   240		return (readl(rc->base + reg) & rst);
   241	}
   242	
   243	static const struct reset_control_ops ast1700_reset_ops = {
   244		.assert = ast1700_reset_assert,
   245		.deassert = ast1700_reset_deassert,
   246		.status = ast1700_reset_status,
   247	};
   248	
   249	static const char *const sdclk_sel0[] = {
   250		"ast1700_0-hpll_divn",
   251		"ast1700_0-apll_divn",
   252	};
   253	
   254	static const char *const sdclk_sel1[] = {
   255		"ast1700_1-hpll_divn",
   256		"ast1700_1-apll_divn",
   257	};
   258	
   259	static const char *const uartclk_sel0[] = {
   260		"ast1700_0-uartxclk",
   261		"ast1700_0-huartxclk",
   262	};
   263	
   264	static const char *const uartclk_sel1[] = {
   265		"ast1700_1-uartxclk",
   266		"ast1700_1-huartxclk",
   267	};
   268	
   269	static const char *const uxclk_sel0[] = {
   270		"ast1700_0-apll_div4",
   271		"ast1700_0-apll_div2",
   272		"ast1700_0-apll",
   273		"ast1700_0-hpll",
   274	};
   275	
   276	static const char *const uxclk_sel1[] = {
   277		"ast1700_1-apll_div4",
   278		"ast1700_1-apll_div2",
   279		"ast1700_1-apll",
   280		"ast1700_1-hpll",
   281	};
   282	
   283	#define CREATE_CLK_NAME(id, suffix) kasprintf(GFP_KERNEL, "ast1700_%d-%s", id, suffix)
   284	
   285	static int AST1700_clk_init(struct device_node *ast1700_node)
   286	{
   287		struct clk_hw_onecell_data *clk_data;
   288		struct ast1700_reset *reset;
   289		u32 uart_clk_source = 0;
   290		void __iomem *clk_base;
   291		struct clk_hw **clks;
   292		struct clk_hw *hw;
   293		u32 val;
   294		int ret;
   295	
   296		int id = ida_simple_get(&ast1700_clk_ida, 0, 0, GFP_KERNEL);
   297	
   298		clk_base = of_iomap(ast1700_node, 0);
   299		WARN_ON(!clk_base);
   300	
 > 301		clk_data = kzalloc(struct_size(clk_data, hws, AST1700_NUM_CLKS), GFP_KERNEL);
   302		if (!clk_data)
   303			return -ENOMEM;
   304	
   305		clk_data->num = AST1700_NUM_CLKS;
   306		clks = clk_data->hws;
   307	
 > 308		reset = kzalloc(sizeof(*reset), GFP_KERNEL);
   309		if (!reset)
   310			return -ENOMEM;
   311	
   312		reset->base = clk_base;
   313	
   314		reset->rcdev.owner = THIS_MODULE;
   315		reset->rcdev.nr_resets = AST1700_RESET_NUMS;
   316		reset->rcdev.ops = &ast1700_reset_ops;
   317		reset->rcdev.of_node = ast1700_node;
   318	
   319		ret = reset_controller_register(&reset->rcdev);
   320		if (ret) {
   321			pr_err("soc1 failed to register reset controller\n");
   322			return ret;
   323		}
   324	
   325		hw = clk_hw_register_fixed_rate(NULL, CREATE_CLK_NAME(id, "clkin"), NULL, 0, AST1700_CLK_25MHZ);
   326		if (IS_ERR(hw))
   327			return PTR_ERR(hw);
   328		clks[AST1700_CLKIN] = hw;
   329	
   330		/* HPLL 1000Mhz */
   331		val = readl(clk_base + AST1700_HPLL_PARAM);
   332		clks[AST1700_CLK_HPLL] = AST1700_calc_pll(CREATE_CLK_NAME(id, "hpll"), CREATE_CLK_NAME(id, "clkin"), val);
   333	
   334		/* HPLL 800Mhz */
   335		val = readl(clk_base + AST1700_APLL_PARAM);
   336		clks[AST1700_CLK_APLL] = AST1700_calc_pll(CREATE_CLK_NAME(id, "apll"), CREATE_CLK_NAME(id, "clkin"), val);
   337	
   338		clks[AST1700_CLK_APLL_DIV2] =
   339			clk_hw_register_fixed_factor(NULL, CREATE_CLK_NAME(id, "apll_div2"), CREATE_CLK_NAME(id, "apll"), 0, 1, 2);
   340	
   341		clks[AST1700_CLK_APLL_DIV4] =
   342			clk_hw_register_fixed_factor(NULL, CREATE_CLK_NAME(id, "apll_div4"), CREATE_CLK_NAME(id, "apll"), 0, 1, 4);
   343	
   344		val = readl(clk_base + AST1700_DPLL_PARAM);
   345		clks[AST1700_CLK_DPLL] = AST1700_calc_pll(CREATE_CLK_NAME(id, "dpll"), CREATE_CLK_NAME(id, "clkin"), val);
   346	
   347		/* uxclk mux selection */
   348		clks[AST1700_CLK_UXCLK] =
   349			clk_hw_register_mux(NULL, CREATE_CLK_NAME(id, "uxclk"),
   350					    (id == 0) ? uxclk_sel0 : uxclk_sel1,
   351					    (id == 0) ? ARRAY_SIZE(uxclk_sel0) : ARRAY_SIZE(uxclk_sel1),
   352					    0, clk_base + AST1700_CLK_SEL2,
   353					    0, 2, 0, &ast1700_clk_lock);
   354	
   355		val = readl(clk_base + AST1700_UXCLK_CTRL);
   356		clks[AST1700_CLK_UARTX] = AST1700_calc_uclk(CREATE_CLK_NAME(id, "uartxclk"), val);
   357	
   358		/* huxclk mux selection */
   359		clks[AST1700_CLK_HUXCLK] =
   360			clk_hw_register_mux(NULL, CREATE_CLK_NAME(id, "huxclk"),
   361					    (id == 0) ? uxclk_sel0 : uxclk_sel1,
   362					    (id == 0) ? ARRAY_SIZE(uxclk_sel0) : ARRAY_SIZE(uxclk_sel1),
   363					    0, clk_base + AST1700_CLK_SEL2,
   364					    3, 2, 0, &ast1700_clk_lock);
   365	
   366		val = readl(clk_base + AST1700_HUXCLK_CTRL);
   367		clks[AST1700_CLK_HUARTX] = AST1700_calc_huclk(CREATE_CLK_NAME(id, "huartxclk"), val);
   368	
   369		/* AHB CLK = 200Mhz */
   370		clks[AST1700_CLK_AHB] =
   371			clk_hw_register_divider_table(NULL, CREATE_CLK_NAME(id, "ahb"),
   372						      CREATE_CLK_NAME(id, "hpll"),
   373						      0, clk_base + AST1700_CLK_SEL2,
   374						      20, 3, 0, ast1700_clk_div_table, &ast1700_clk_lock);
   375	
   376		/* APB CLK = 100Mhz */
   377		clks[AST1700_CLK_APB] =
   378			clk_hw_register_divider_table(NULL, CREATE_CLK_NAME(id, "apb"),
   379						      CREATE_CLK_NAME(id, "hpll"),
   380						      0, clk_base + AST1700_CLK_SEL1,
   381						      18, 3, 0, ast1700_clk_div_table2, &ast1700_clk_lock);
   382	
   383		//rmii
   384		clks[AST1700_CLK_RMII] =
   385			clk_hw_register_divider_table(NULL, CREATE_CLK_NAME(id, "rmii"),
   386						      CREATE_CLK_NAME(id, "hpll"),
   387						      0, clk_base + AST1700_CLK_SEL2,
   388						      21, 3, 0, ast1700_rmii_div_table, &ast1700_clk_lock);
   389	
   390		//rgmii
   391		clks[AST1700_CLK_RGMII] =
   392			clk_hw_register_divider_table(NULL, CREATE_CLK_NAME(id, "rgmii"),
   393						      CREATE_CLK_NAME(id, "hpll"),
   394						      0, clk_base + AST1700_CLK_SEL2,
   395						      25, 3, 0, ast1700_rgmii_div_table, &ast1700_clk_lock);
   396	
   397		//mac hclk
   398		clks[AST1700_CLK_MACHCLK] =
   399			clk_hw_register_divider_table(NULL, CREATE_CLK_NAME(id, "machclk"),
   400						      CREATE_CLK_NAME(id, "hpll"),
   401						      0, clk_base + AST1700_CLK_SEL2,
   402						      29, 3, 0, ast1700_clk_div_table, &ast1700_clk_lock);
   403	
   404		clks[AST1700_CLK_GATE_LCLK0] =
   405			AST1700_clk_hw_register_gate(NULL, CREATE_CLK_NAME(id, "lclk0-gate"), NULL,
   406						     CLK_IS_CRITICAL, clk_base + AST1700_CLK_STOP,
   407						     0, 0, &ast1700_clk_lock);
   408	
   409		clks[AST1700_CLK_GATE_LCLK0] =
   410			AST1700_clk_hw_register_gate(NULL, CREATE_CLK_NAME(id, "lclk1-gate"), NULL,
   411						     CLK_IS_CRITICAL, clk_base + AST1700_CLK_STOP,
   412						     1, 0, &ast1700_clk_lock);
   413	
   414		clks[AST1700_CLK_GATE_ESPI0CLK] =
   415			AST1700_clk_hw_register_gate(NULL, CREATE_CLK_NAME(id, "espi0clk-gate"), NULL,
   416						     CLK_IS_CRITICAL, clk_base + AST1700_CLK_STOP,
   417						     2, 0, &ast1700_clk_lock);
   418	
   419		clks[AST1700_CLK_GATE_ESPI1CLK] =
   420			AST1700_clk_hw_register_gate(NULL, CREATE_CLK_NAME(id, "espi1clk-gate"), NULL,
   421						     CLK_IS_CRITICAL, clk_base + AST1700_CLK_STOP,
   422						     3, 0, &ast1700_clk_lock);
   423	
   424		//sd pll divn
   425		clks[AST1700_CLK_HPLL_DIVN] =
   426			clk_hw_register_divider_table(NULL, CREATE_CLK_NAME(id, "hpll_divn"),
   427						      CREATE_CLK_NAME(id, "hpll"),
   428						      0, clk_base + AST1700_CLK_SEL2,
   429						      20, 3, 0, ast1700_clk_div_table, &ast1700_clk_lock);
   430	
   431		clks[AST1700_CLK_APLL_DIVN] =
   432			clk_hw_register_divider_table(NULL, CREATE_CLK_NAME(id, "apll_divn"),
   433						      CREATE_CLK_NAME(id, "apll"),
   434						      0, clk_base + AST1700_CLK_SEL2,
   435						      8, 3, 0, ast1700_clk_div_table, &ast1700_clk_lock);
   436	
   437		//sd clk
   438		clks[AST1700_CLK_SDCLK] =
   439			clk_hw_register_mux(NULL, CREATE_CLK_NAME(id, "sdclk"),
   440					    (id == 0) ? sdclk_sel0 : sdclk_sel1,
   441					    (id == 0) ? ARRAY_SIZE(sdclk_sel0) : ARRAY_SIZE(sdclk_sel1),
   442					    0, clk_base + AST1700_CLK_SEL1,
   443					    13, 1, 0, &ast1700_clk_lock);
   444	
   445		clks[AST1700_CLK_GATE_SDCLK] =
   446			AST1700_clk_hw_register_gate(NULL, CREATE_CLK_NAME(id, "sdclk-gate"),
   447						     CREATE_CLK_NAME(id, "sdclk"),
   448						     0, clk_base + AST1700_CLK_STOP,
   449						     4, 0, &ast1700_clk_lock);
   450	
   451		clks[AST1700_CLK_GATE_REFCLK] =
   452			AST1700_clk_hw_register_gate(NULL, CREATE_CLK_NAME(id, "io-refclk-gate"), NULL,
   453						     CLK_IS_CRITICAL, clk_base + AST1700_CLK_STOP,
   454						     6, 0, &ast1700_clk_lock);
   455	
   456		clks[AST1700_CLK_GATE_LPCHCLK] =
   457			AST1700_clk_hw_register_gate(NULL, CREATE_CLK_NAME(id, "lpchclk-gate"), NULL,
   458						     CLK_IS_CRITICAL, clk_base + AST1700_CLK_STOP,
   459						     7, 0, &ast1700_clk_lock);
   460	
   461		clks[AST1700_CLK_GATE_MAC0CLK] =
   462			AST1700_clk_hw_register_gate(NULL, CREATE_CLK_NAME(id, "mac0clk-gate"), NULL,
   463						     0, clk_base + AST1700_CLK_STOP,
   464						     8, 0, &ast1700_clk_lock);
   465	
   466		clks[AST1700_CLK_GATE_MAC1CLK] =
   467			AST1700_clk_hw_register_gate(NULL, CREATE_CLK_NAME(id, "mac1clk-gate"), NULL,
   468						     0, clk_base + AST1700_CLK_STOP,
   469						     9, 0, &ast1700_clk_lock);
   470	
   471		clks[AST1700_CLK_GATE_MAC2CLK] =
   472			AST1700_clk_hw_register_gate(NULL, CREATE_CLK_NAME(id, "mac2clk-gate"), NULL,
   473						     0, clk_base + AST1700_CLK_STOP,
   474						     10, 0, &ast1700_clk_lock);
   475	
   476		of_property_read_u32(ast1700_node, "uart-clk-source", &uart_clk_source);
   477	
   478		if (uart_clk_source) {
   479			val = readl(clk_base + AST1700_CLK_SEL1) & GENMASK(12, 0);
   480			uart_clk_source &= GENMASK(12, 0);
   481			writel(val | uart_clk_source, clk_base + AST1700_CLK_SEL1);
   482		}
   483	
   484		//UART0
   485		clks[AST1700_CLK_UART0] =
   486			clk_hw_register_mux(NULL, CREATE_CLK_NAME(id, "uart0clk"),
   487					    (id == 0) ? uartclk_sel0 : uartclk_sel1,
   488					    (id == 0) ? ARRAY_SIZE(uartclk_sel0) : ARRAY_SIZE(uartclk_sel1),
   489					    0, clk_base + AST1700_CLK_SEL1,
   490					    0, 1, 0, &ast1700_clk_lock);
   491	
   492		clks[AST1700_CLK_GATE_UART0CLK] =
   493			AST1700_clk_hw_register_gate(NULL, CREATE_CLK_NAME(id, "uart0clk-gate"),
   494						     CREATE_CLK_NAME(id, "uart0clk"),
   495						     0, clk_base + AST1700_CLK_STOP,
   496						     11, 0, &ast1700_clk_lock);
   497	
   498		//UART1
   499		clks[AST1700_CLK_UART1] =
   500			clk_hw_register_mux(NULL, CREATE_CLK_NAME(id, "uart1clk"),
   501					    (id == 0) ? uartclk_sel0 : uartclk_sel1,
   502					    (id == 0) ? ARRAY_SIZE(uartclk_sel0) : ARRAY_SIZE(uartclk_sel1),
   503					    0, clk_base + AST1700_CLK_SEL1,
   504					    1, 1, 0, &ast1700_clk_lock);
   505	
   506		clks[AST1700_CLK_GATE_UART1CLK] =
   507			AST1700_clk_hw_register_gate(NULL, CREATE_CLK_NAME(id, "uart1clk-gate"),
   508						     CREATE_CLK_NAME(id, "uart1clk"),
   509						     0, clk_base + AST1700_CLK_STOP,
   510						     12, 0, &ast1700_clk_lock);
   511	
   512		//UART2
   513		clks[AST1700_CLK_UART2] =
   514			clk_hw_register_mux(NULL, CREATE_CLK_NAME(id, "uart2clk"),
   515					    (id == 0) ? uartclk_sel0 : uartclk_sel1,
   516					    (id == 0) ? ARRAY_SIZE(uartclk_sel0) : ARRAY_SIZE(uartclk_sel1),
   517					    0, clk_base + AST1700_CLK_SEL1,
   518					    2, 1, 0, &ast1700_clk_lock);
   519	
   520		clks[AST1700_CLK_GATE_UART2CLK] =
   521			AST1700_clk_hw_register_gate(NULL, CREATE_CLK_NAME(id, "uart2clk-gate"),
   522						     CREATE_CLK_NAME(id, "uart2clk"),
   523						     0, clk_base + AST1700_CLK_STOP,
   524						     13, 0, &ast1700_clk_lock);
   525	
   526		//UART3
   527		clks[AST1700_CLK_UART3] =
   528			clk_hw_register_mux(NULL, CREATE_CLK_NAME(id, "uart3clk"),
   529					    (id == 0) ? uartclk_sel0 : uartclk_sel1,
   530					    (id == 0) ? ARRAY_SIZE(uartclk_sel0) : ARRAY_SIZE(uartclk_sel1),
   531					    0, clk_base + AST1700_CLK_SEL1,
   532					    3, 1, 0, &ast1700_clk_lock);
   533	
   534		clks[AST1700_CLK_GATE_UART3CLK] =
   535			AST1700_clk_hw_register_gate(NULL, CREATE_CLK_NAME(id, "uart3clk-gate"),
   536						     CREATE_CLK_NAME(id, "uart3clk"),
   537						     0, clk_base + AST1700_CLK_STOP,
   538						     14, 0, &ast1700_clk_lock);
   539	
   540		clks[AST1700_CLK_GATE_I3C0CLK] =
   541			AST1700_clk_hw_register_gate(NULL, CREATE_CLK_NAME(id, "i3c0clk-gate"),
   542						     CREATE_CLK_NAME(id, "ahb"),
   543						     0, clk_base + AST1700_CLK_STOP,
   544						     16, 0, &ast1700_clk_lock);
   545	
   546		clks[AST1700_CLK_GATE_I3C1CLK] =
   547			AST1700_clk_hw_register_gate(NULL, CREATE_CLK_NAME(id, "i3c1clk-gate"),
   548						     CREATE_CLK_NAME(id, "ahb"),
   549						     0, clk_base + AST1700_CLK_STOP,
   550						     17, 0, &ast1700_clk_lock);
   551	
   552		clks[AST1700_CLK_GATE_I3C2CLK] =
   553			AST1700_clk_hw_register_gate(NULL, CREATE_CLK_NAME(id, "i3c2clk-gate"),
   554						     CREATE_CLK_NAME(id, "ahb"),
   555						     0, clk_base + AST1700_CLK_STOP,
   556						     18, 0, &ast1700_clk_lock);
   557	
   558		clks[AST1700_CLK_GATE_I3C3CLK] =
   559			AST1700_clk_hw_register_gate(NULL, CREATE_CLK_NAME(id, "i3c3clk-gate"),
   560						     CREATE_CLK_NAME(id, "ahb"),
   561						     0, clk_base + AST1700_CLK_STOP,
   562						     19, 0, &ast1700_clk_lock);
   563	
   564		clks[AST1700_CLK_GATE_I3C4CLK] =
   565			AST1700_clk_hw_register_gate(NULL, CREATE_CLK_NAME(id, "i3c4clk-gate"),
   566						     CREATE_CLK_NAME(id, "ahb"),
   567						     0, clk_base + AST1700_CLK_STOP,
   568						     20, 0, &ast1700_clk_lock);
   569	
   570		clks[AST1700_CLK_GATE_I3C5CLK] =
   571			AST1700_clk_hw_register_gate(NULL, CREATE_CLK_NAME(id, "i3c5clk-gate"),
   572						     CREATE_CLK_NAME(id, "ahb"),
   573						     0, clk_base + AST1700_CLK_STOP,
   574						     21, 0, &ast1700_clk_lock);
   575	
   576		clks[AST1700_CLK_GATE_I3C6CLK] =
   577			AST1700_clk_hw_register_gate(NULL, CREATE_CLK_NAME(id, "i3c6clk-gate"),
   578						     CREATE_CLK_NAME(id, "ahb"),
   579						     0, clk_base + AST1700_CLK_STOP,
   580						     22, 0, &ast1700_clk_lock);
   581	
   582		clks[AST1700_CLK_GATE_I3C7CLK] =
   583			AST1700_clk_hw_register_gate(NULL, CREATE_CLK_NAME(id, "i3c7clk-gate"),
   584						     CREATE_CLK_NAME(id, "ahb"),
   585						     0, clk_base + AST1700_CLK_STOP,
   586						     23, 0, &ast1700_clk_lock);
   587	
   588		clks[AST1700_CLK_GATE_I3C8CLK] =
   589			AST1700_clk_hw_register_gate(NULL, CREATE_CLK_NAME(id, "i3c8clk-gate"),
   590						     CREATE_CLK_NAME(id, "ahb"),
   591						     0, clk_base + AST1700_CLK_STOP,
   592						     24, 0, &ast1700_clk_lock);
   593	
   594		clks[AST1700_CLK_GATE_I3C9CLK] =
   595			AST1700_clk_hw_register_gate(NULL, CREATE_CLK_NAME(id, "i3c9clk-gate"),
   596						     CREATE_CLK_NAME(id, "ahb"),
   597						     0, clk_base + AST1700_CLK_STOP,
   598						     25, 0, &ast1700_clk_lock);
   599	
   600		clks[AST1700_CLK_GATE_I3C10CLK] =
   601			AST1700_clk_hw_register_gate(NULL, CREATE_CLK_NAME(id, "i3c10clk-gate"),
   602						     CREATE_CLK_NAME(id, "ahb"),
   603						     0, clk_base + AST1700_CLK_STOP,
   604						     26, 0, &ast1700_clk_lock);
   605	
   606		clks[AST1700_CLK_GATE_I3C11CLK] =
   607			AST1700_clk_hw_register_gate(NULL, CREATE_CLK_NAME(id, "i3c11clk-gate"),
   608						     CREATE_CLK_NAME(id, "ahb"),
   609						     0, clk_base + AST1700_CLK_STOP,
   610						     27, 0, &ast1700_clk_lock);
   611	
   612		clks[AST1700_CLK_GATE_I3C12CLK] =
   613			AST1700_clk_hw_register_gate(NULL, CREATE_CLK_NAME(id, "i3c12clk-gate"),
   614						     CREATE_CLK_NAME(id, "ahb"),
   615						     0, clk_base + AST1700_CLK_STOP,
   616						     28, 0, &ast1700_clk_lock);
   617	
   618		clks[AST1700_CLK_GATE_I3C13CLK] =
   619			AST1700_clk_hw_register_gate(NULL, CREATE_CLK_NAME(id, "i3c13clk-gate"),
   620						     CREATE_CLK_NAME(id, "ahb"),
   621						     0, clk_base + AST1700_CLK_STOP,
   622						     29, 0, &ast1700_clk_lock);
   623	
   624		clks[AST1700_CLK_GATE_I3C14CLK] =
   625			AST1700_clk_hw_register_gate(NULL, CREATE_CLK_NAME(id, "i3c14clk-gate"),
   626						     CREATE_CLK_NAME(id, "ahb"),
   627						     0, clk_base + AST1700_CLK_STOP,
   628						     30, 0, &ast1700_clk_lock);
   629	
   630		clks[AST1700_CLK_GATE_I3C15CLK] =
   631			AST1700_clk_hw_register_gate(NULL, CREATE_CLK_NAME(id, "i3c15clk-gate"),
   632						     CREATE_CLK_NAME(id, "ahb"),
   633						     0, clk_base + AST1700_CLK_STOP,
   634						     31, 0, &ast1700_clk_lock);
   635	
   636		/*clk stop 2 */
   637		//UART5
   638		clks[AST1700_CLK_UART5] =
   639			clk_hw_register_mux(NULL, CREATE_CLK_NAME(id, "uart5clk"),
   640					    (id == 0) ? uartclk_sel0 : uartclk_sel1,
   641					    (id == 0) ? ARRAY_SIZE(uartclk_sel0) : ARRAY_SIZE(uartclk_sel1),
   642					    0, clk_base + AST1700_CLK_SEL1,
   643					    5, 1, 0, &ast1700_clk_lock);
   644	
   645		clks[AST1700_CLK_GATE_UART5CLK] =
   646			AST1700_clk_hw_register_gate(NULL, CREATE_CLK_NAME(id, "uart5clk-gate"),
   647						     CREATE_CLK_NAME(id, "uart5clk"),
   648						     0, clk_base + AST1700_CLK_STOP2,
   649						     0, 0, &ast1700_clk_lock);
   650	
   651		//UART6
   652		clks[AST1700_CLK_UART6] =
   653			clk_hw_register_mux(NULL, CREATE_CLK_NAME(id, "uart6clk"),
   654					    (id == 0) ? uartclk_sel0 : uartclk_sel1,
   655					    (id == 0) ? ARRAY_SIZE(uartclk_sel0) : ARRAY_SIZE(uartclk_sel1),
   656					    0, clk_base + AST1700_CLK_SEL1,
   657					    6, 1, 0, &ast1700_clk_lock);
   658	
   659		clks[AST1700_CLK_GATE_UART6CLK] =
   660			AST1700_clk_hw_register_gate(NULL, CREATE_CLK_NAME(id, "uart6clk-gate"),
   661						     CREATE_CLK_NAME(id, "uart6clk"),
   662						     0, clk_base + AST1700_CLK_STOP2,
   663						     1, 0, &ast1700_clk_lock);
   664	
   665		//UART7
   666		clks[AST1700_CLK_UART7] =
   667			clk_hw_register_mux(NULL, CREATE_CLK_NAME(id, "uart7clk"),
   668					    (id == 0) ? uartclk_sel0 : uartclk_sel1,
   669					    (id == 0) ? ARRAY_SIZE(uartclk_sel0) : ARRAY_SIZE(uartclk_sel1),
   670					    0, clk_base + AST1700_CLK_SEL1,
   671					    7, 1, 0, &ast1700_clk_lock);
   672	
   673		clks[AST1700_CLK_GATE_UART7CLK] =
   674			AST1700_clk_hw_register_gate(NULL, CREATE_CLK_NAME(id, "uart7clk-gate"),
   675						     CREATE_CLK_NAME(id, "uart7clk"),
   676						     0, clk_base + AST1700_CLK_STOP2,
   677						     2, 0, &ast1700_clk_lock);
   678	
   679		//UART8
   680		clks[AST1700_CLK_UART8] =
   681			clk_hw_register_mux(NULL, CREATE_CLK_NAME(id, "uart8clk"),
   682					    (id == 0) ? uartclk_sel0 : uartclk_sel1,
   683					    (id == 0) ? ARRAY_SIZE(uartclk_sel0) : ARRAY_SIZE(uartclk_sel1),
   684					    0, clk_base + AST1700_CLK_SEL1,
   685					    8, 1, 0, &ast1700_clk_lock);
   686	
   687		clks[AST1700_CLK_GATE_UART8CLK] =
   688			AST1700_clk_hw_register_gate(NULL, CREATE_CLK_NAME(id, "uart8clk-gate"),
   689						     CREATE_CLK_NAME(id, "uart8clk"),
   690						     0, clk_base + AST1700_CLK_STOP2,
   691						     3, 0, &ast1700_clk_lock);
   692	
   693		//UART9
   694		clks[AST1700_CLK_UART9] =
   695			clk_hw_register_mux(NULL, CREATE_CLK_NAME(id, "uart9clk"),
   696					    (id == 0) ? uartclk_sel0 : uartclk_sel1,
   697					    (id == 0) ? ARRAY_SIZE(uartclk_sel0) : ARRAY_SIZE(uartclk_sel1),
   698					    0, clk_base + AST1700_CLK_SEL1,
   699					    9, 1, 0, &ast1700_clk_lock);
   700	
   701		clks[AST1700_CLK_GATE_UART9CLK] =
   702			AST1700_clk_hw_register_gate(NULL, CREATE_CLK_NAME(id, "uart9clk-gate"),
   703						     CREATE_CLK_NAME(id, "uart9clk"),
   704						     0, clk_base + AST1700_CLK_STOP2,
   705						     4, 0, &ast1700_clk_lock);
   706	
   707		//UART10
   708		clks[AST1700_CLK_UART10] =
   709			clk_hw_register_mux(NULL, CREATE_CLK_NAME(id, "uart10clk"),
   710					    (id == 0) ? uartclk_sel0 : uartclk_sel1,
   711					    (id == 0) ? ARRAY_SIZE(uartclk_sel0) : ARRAY_SIZE(uartclk_sel1),
   712					    0, clk_base + AST1700_CLK_SEL1,
   713					    10, 1, 0, &ast1700_clk_lock);
   714	
   715		clks[AST1700_CLK_GATE_UART10CLK] =
   716			AST1700_clk_hw_register_gate(NULL, CREATE_CLK_NAME(id, "uart10clk-gate"),
   717						     CREATE_CLK_NAME(id, "uart10clk"),
   718						     0, clk_base + AST1700_CLK_STOP2,
   719						     5, 0, &ast1700_clk_lock);
   720	
   721		//UART11
   722		clks[AST1700_CLK_UART11] =
   723			clk_hw_register_mux(NULL, CREATE_CLK_NAME(id, "uart11clk"),
   724					    (id == 0) ? uartclk_sel0 : uartclk_sel1,
   725					    (id == 0) ? ARRAY_SIZE(uartclk_sel0) : ARRAY_SIZE(uartclk_sel1),
   726					    0, clk_base + AST1700_CLK_SEL1,
   727					    11, 1, 0, &ast1700_clk_lock);
   728	
   729		clks[AST1700_CLK_GATE_UART11CLK] =
   730			AST1700_clk_hw_register_gate(NULL, CREATE_CLK_NAME(id, "uart11clk-gate"),
   731						     CREATE_CLK_NAME(id, "uart11clk"),
   732						     0, clk_base + AST1700_CLK_STOP2,
   733						     6, 0, &ast1700_clk_lock);
   734	
   735		//uart12: call bmc uart
   736		clks[AST1700_CLK_UART12] =
   737			clk_hw_register_mux(NULL, CREATE_CLK_NAME(id, "uart12clk"),
   738					    (id == 0) ? uartclk_sel0 : uartclk_sel1,
   739					    (id == 0) ? ARRAY_SIZE(uartclk_sel0) : ARRAY_SIZE(uartclk_sel1),
   740					    0, clk_base + AST1700_CLK_SEL1,
   741					    12, 1, 0, &ast1700_clk_lock);
   742	
   743		clks[AST1700_CLK_GATE_UART12CLK] =
   744			AST1700_clk_hw_register_gate(NULL, CREATE_CLK_NAME(id, "uart12clk-gate"),
   745						     CREATE_CLK_NAME(id, "uart12clk"),
   746						     0, clk_base + AST1700_CLK_STOP2,
   747						     7, 0, &ast1700_clk_lock);
   748	
   749		clks[AST1700_CLK_GATE_FSICLK] =
   750			AST1700_clk_hw_register_gate(NULL, CREATE_CLK_NAME(id, "fsiclk-gate"), NULL,
   751						     0, clk_base + AST1700_CLK_STOP2,
   752						     8, 0, &ast1700_clk_lock);
   753	
   754		clks[AST1700_CLK_GATE_LTPIPHYCLK] =
   755			AST1700_clk_hw_register_gate(NULL, CREATE_CLK_NAME(id, "ltpiphyclk-gate"), NULL,
   756						     CLK_IS_CRITICAL, clk_base + AST1700_CLK_STOP2,
   757						     9, 0, &ast1700_clk_lock);
   758	
   759		clks[AST1700_CLK_GATE_LTPICLK] =
   760			AST1700_clk_hw_register_gate(NULL, CREATE_CLK_NAME(id, "ltpiclk-gate"), NULL,
   761						     CLK_IS_CRITICAL, clk_base + AST1700_CLK_STOP2,
   762						     10, 0, &ast1700_clk_lock);
   763	
   764		clks[AST1700_CLK_GATE_VGALCLK] =
   765			AST1700_clk_hw_register_gate(NULL, CREATE_CLK_NAME(id, "vgalclk-gate"), NULL,
   766						     0, clk_base + AST1700_CLK_STOP2,
   767						     11, 0, &ast1700_clk_lock);
   768	
   769		clks[AST1700_CLK_GATE_USBUARTCLK] =
   770			AST1700_clk_hw_register_gate(NULL, CREATE_CLK_NAME(id, "usbuartclk-gate"), NULL,
   771						     0, clk_base + AST1700_CLK_STOP2,
   772						     12, 0, &ast1700_clk_lock);
   773	
   774		clk_hw_register_fixed_factor(NULL, CREATE_CLK_NAME(id, "canclk"), CREATE_CLK_NAME(id, "apll"), 0, 1, 10);
   775	
   776		clks[AST1700_CLK_GATE_CANCLK] =
   777			AST1700_clk_hw_register_gate(NULL, CREATE_CLK_NAME(id, "canclk-gate"),
   778						     CREATE_CLK_NAME(id, "canclk"),
   779						     0, clk_base + AST1700_CLK_STOP2,
   780						     13, 0, &ast1700_clk_lock);
   781	
   782		clks[AST1700_CLK_GATE_PCICLK] =
   783			AST1700_clk_hw_register_gate(NULL, CREATE_CLK_NAME(id, "pciclk-gate"), NULL,
   784						     0, clk_base + AST1700_CLK_STOP2,
   785						     14, 0, &ast1700_clk_lock);
   786	
   787		clks[AST1700_CLK_GATE_SLICLK] =
   788			AST1700_clk_hw_register_gate(NULL, CREATE_CLK_NAME(id, "sliclk-gate"), NULL,
   789						     0, clk_base + AST1700_CLK_STOP2,
   790						     15, 0, &ast1700_clk_lock);
   791	
   792		of_clk_add_hw_provider(ast1700_node, of_clk_hw_onecell_get, clk_data);
   793	
   794		return 0;
   795	};
   796	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
