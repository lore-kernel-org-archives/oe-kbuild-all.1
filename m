Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D88A1586CF
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 May 2024 18:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714760390; cv=none; b=UTuIeZzbb3cXNYepxXT7G61keB3bBa00BBhD+vzlWU032LbcqEVQwbUVki48HQ2P7iXGF11181H+HiZb+CtUNWNamUfroYJneywbTFAbX0I8baVn/qFWr4PxNFBUXCX/YgWVs0crJZmn1WfU5/Ntt1OK8r7vmXMZCtVKu5sRoG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714760390; c=relaxed/simple;
	bh=OpwSHkSIhEmgEZr4jDFuVBLeqxPrJjBZvd5H1XuC4z4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qSkjrYnLVymUAye7tHwvAq9tRetBuRBRroVb0tb4in5ClHJCvRUXUoS1EGMYMP6agf1JDdZ3plupfAFwm1Vs9m8KEjdUmdMKpfilVJGs6zjVyvrET7Nb4+MvkdzJKLrOG0nkCi8//HaE3yVVx3Nu2u9LFZ6zv8t80oc2cPWw/dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sg91j+Py; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sg91j+Py"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714760388; x=1746296388;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OpwSHkSIhEmgEZr4jDFuVBLeqxPrJjBZvd5H1XuC4z4=;
  b=Sg91j+PyzAkTeix46QcM+ZzDKvcQZsAFihyGgdYF2tAnn2I+TGxklMon
   s/urqCCHVOD9p4c2Jg6ZkQ12/M5p4XCpu6U3p3Nbk+O2VO9RCfl3ka6xz
   nId1eNkv4rgEm1fJH+N1r8zKw9vM1rUywt00IpbGvpz2S9Fw5LAhhiT9W
   ZRV2oXOwAeXznk/GNnwgwsrKT6pUizXwxifbp21GnBSFEOLGFpiFdHVvX
   0KcwUNrr9amU3aPCHAdmIJI4kLmdYMhnAmFz2AGgKtP2RfMBUXl/F9nx8
   9ekxaZvxjX3uQZeCgD/AT8PECF5fd70WQ3GgocfjMYEDUiCBElFbp+BRi
   w==;
X-CSE-ConnectionGUID: VVFR+h9uRy6tnvjhuw8Bvg==
X-CSE-MsgGUID: uKOdlVQwRPiUv919pDmfwQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="11113876"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="11113876"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2024 11:19:47 -0700
X-CSE-ConnectionGUID: 5BRTPA34Qn6QSSPkJvujSw==
X-CSE-MsgGUID: HE65jXUATSOMnHAOQVRsXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="27548806"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 03 May 2024 11:19:46 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s2xVY-000BzU-0A;
	Fri, 03 May 2024 18:19:44 +0000
Date: Sat, 4 May 2024 02:19:42 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Stanley <joel@jms.id.au>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [shenki:aspeed-6.9-rebase 837/1143]
 drivers/clk/clk-ast1700.c:301:11: error: incompatible integer to pointer
 conversion assigning to 'struct clk_hw_onecell_data *' from 'int'
Message-ID: <202405040240.g9MMpg3W-lkp@intel.com>
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
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20240504/202405040240.g9MMpg3W-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 37ae4ad0eef338776c7e2cffb3896153d43dcd90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240504/202405040240.g9MMpg3W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405040240.g9MMpg3W-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/clk/clk-ast1700.c:5:
   In file included from include/linux/of_address.h:7:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/clk/clk-ast1700.c:5:
   In file included from include/linux/of_address.h:7:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/clk/clk-ast1700.c:5:
   In file included from include/linux/of_address.h:7:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   drivers/clk/clk-ast1700.c:113:16: warning: no previous prototype for function 'AST1700_calc_pll' [-Wmissing-prototypes]
     113 | struct clk_hw *AST1700_calc_pll(const char *name, const char *parent_name, u32 val)
         |                ^
   drivers/clk/clk-ast1700.c:113:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     113 | struct clk_hw *AST1700_calc_pll(const char *name, const char *parent_name, u32 val)
         | ^
         | static 
   drivers/clk/clk-ast1700.c:180:9: error: call to undeclared function 'kzalloc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     180 |         gate = kzalloc(sizeof(*gate), GFP_KERNEL);
         |                ^
   drivers/clk/clk-ast1700.c:180:9: note: did you mean 'vzalloc'?
   include/linux/vmalloc.h:142:14: note: 'vzalloc' declared here
     142 | extern void *vzalloc(unsigned long size) __alloc_size(1);
         |              ^
   drivers/clk/clk-ast1700.c:180:7: error: incompatible integer to pointer conversion assigning to 'struct clk_gate *' from 'int' [-Wint-conversion]
     180 |         gate = kzalloc(sizeof(*gate), GFP_KERNEL);
         |              ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/clk-ast1700.c:199:3: error: call to undeclared function 'kfree'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     199 |                 kfree(gate);
         |                 ^
   drivers/clk/clk-ast1700.c:199:3: note: did you mean 'vfree'?
   include/linux/vmalloc.h:162:13: note: 'vfree' declared here
     162 | extern void vfree(const void *addr);
         |             ^
   drivers/clk/clk-ast1700.c:301:13: error: call to undeclared function 'kzalloc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     301 |         clk_data = kzalloc(struct_size(clk_data, hws, AST1700_NUM_CLKS), GFP_KERNEL);
         |                    ^
>> drivers/clk/clk-ast1700.c:301:11: error: incompatible integer to pointer conversion assigning to 'struct clk_hw_onecell_data *' from 'int' [-Wint-conversion]
     301 |         clk_data = kzalloc(struct_size(clk_data, hws, AST1700_NUM_CLKS), GFP_KERNEL);
         |                  ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/clk/clk-ast1700.c:308:8: error: incompatible integer to pointer conversion assigning to 'struct ast1700_reset *' from 'int' [-Wint-conversion]
     308 |         reset = kzalloc(sizeof(*reset), GFP_KERNEL);
         |               ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   7 warnings and 6 errors generated.


vim +301 drivers/clk/clk-ast1700.c

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
