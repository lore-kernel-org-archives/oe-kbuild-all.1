Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D6A224244
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Jun 2025 09:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749719873; cv=none; b=UuCFanZe5QeK0mvWWqmdIwFcH5CVPgigbidWPuW/b9v215JlKbLUAFdQAjFfuN0cCVYAaLUWUmXKsrLID3qtmBbOWHfFhwIpmoxhP0VTgObed4SkJvBDxIOFOlHGEHhd8cbK814uSMJ+JN5783vRakOTtGwmOvjtpvsVC+kvCTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749719873; c=relaxed/simple;
	bh=hzJth64bFxcjA60N5I8rnVU49s0F68n0rOt2N6UywDE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ce8sh4ieJoyX4h0Ho9GjRGFAqUZcdLikutVHxVgBishVL51TMb+FbiNxn1WHviv1hJ29lLzwemfNfgOsSSgZFLY59m/8oKZ+cndAmcXK5FpLUN1sYcYxQ8DWYj5NS+/9ZoIW7SA9UeT4GxI8WzHpg/DX+ZrmrejPCWfawzYxgHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xxo8Sdm0; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xxo8Sdm0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749719872; x=1781255872;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hzJth64bFxcjA60N5I8rnVU49s0F68n0rOt2N6UywDE=;
  b=Xxo8Sdm0USY3tmnahI9ZNeH/KPhBPexbmBGX2Ngs1rxOhZokbVMV6Xpj
   AQo0MAuRIewtoaclnHf8yYKPIwzs2bA5cA7TXnkb2d9ZHv5k7KtoAqAYy
   hzOjGBO738702OT8Z1O/DhJvCMJP8TJF29VjJriAzCXzxTSFDaYiHW72n
   DzycoECWJqeOJpB6WmTlMRWq4euKKwdx1hZcPNl0z+6R9ocMtutBHMRw6
   U3xxPTTZsJAlJVSgIaQUeLNrwVSZUA38u4tJksnWbXhcazBJ5SnIBvjXg
   KGfAqHj47NGdRc7E8i11bQWFJX6uyouVSpQZS0PEZa5pPJtP4GJNt/BCs
   Q==;
X-CSE-ConnectionGUID: nmZAeFS6Tg2Af8+xAiA1tQ==
X-CSE-MsgGUID: i5mLYRqERT28g0Wonl5lrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="52031368"
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; 
   d="scan'208";a="52031368"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2025 02:17:51 -0700
X-CSE-ConnectionGUID: CPwBpeWvRIWabBlm9Jihag==
X-CSE-MsgGUID: dpvQx6ZUQZKG+Kz7AWJw7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; 
   d="scan'208";a="152609801"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 12 Jun 2025 02:17:49 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uPe4A-000BMc-34;
	Thu, 12 Jun 2025 09:17:46 +0000
Date: Thu, 12 Jun 2025 17:17:00 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.16-rsslro 31/58]
 drivers/net/pcs/pcs-airoha.c:2824:undefined reference to
 `phylink_release_pcs'
Message-ID: <202506121733.JkZxu2qi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.16-rsslro
head:   3e8680f9c70c02b4e5543d7f9fc2a0ced5e5838a
commit: f0ce78d2e4b38db43728486f89ba62749d9488c8 [31/58] net: pcs: airoha: add PCS driver for Airoha SoC
config: s390-randconfig-r073-20250611 (https://download.01.org/0day-ci/archive/20250612/202506121733.JkZxu2qi-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250612/202506121733.JkZxu2qi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506121733.JkZxu2qi-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390x-linux-ld: drivers/net/pcs/pcs-airoha.o: in function `airoha_pcs_remove':
>> drivers/net/pcs/pcs-airoha.c:2824:(.text+0x19e4): undefined reference to `phylink_release_pcs'
   s390x-linux-ld: drivers/net/pcs/pcs-airoha.o: in function `airoha_pcs_get_state':
>> drivers/net/pcs/pcs-airoha.c:2295:(.text+0x2482): undefined reference to `phylink_mii_c22_pcs_decode_state'
>> s390x-linux-ld: drivers/net/pcs/pcs-airoha.c:2314:(.text+0x2662): undefined reference to `phylink_decode_usxgmii_word'
   s390x-linux-ld: drivers/net/pcs/pcs-airoha.o: in function `airoha_pcs_config':
>> drivers/net/pcs/pcs-airoha.c:2441:(.text+0x6140): undefined reference to `phylink_mii_c22_pcs_encode_advertisement'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for FWNODE_PCS
   Depends on [n]: NETDEVICES [=y] && (ACPI || OF [=n]) && PHYLINK [=n]
   Selected by [y]:
   - PCS_AIROHA [=y] && NETDEVICES [=y]

New smatch warnings:
drivers/net/pcs/pcs-airoha.c:2060 airoha_pcs_rx_prcal() error: uninitialized symbol 'best_prcal_search_bit'.
drivers/net/pcs/pcs-airoha.c:2596 airoha_pcs_link_up() error: uninitialized symbol 'mode'.
drivers/net/pcs/pcs-airoha.c:2602 airoha_pcs_link_up() error: uninitialized symbol 'rate_adapt'.
drivers/net/pcs/pcs-airoha.c:2630 airoha_pcs_link_up() error: uninitialized symbol 'force_speed'.
drivers/net/pcs/pcs-airoha.c:2663 airoha_pcs_link_up() error: uninitialized symbol 'if_mode'.
drivers/net/pcs/pcs-airoha.c:2668 airoha_pcs_link_up() error: uninitialized symbol 'ck_gen_mode'.
drivers/net/pcs/pcs-airoha.c:2675 airoha_pcs_link_up() error: uninitialized symbol 'speed_reg'.

Old smatch warnings:
drivers/net/pcs/pcs-airoha.c:2630 airoha_pcs_link_up() error: uninitialized symbol 'rate_adapt'.

vim +2824 drivers/net/pcs/pcs-airoha.c

  2541	
  2542	static void airoha_pcs_link_up(struct phylink_pcs *pcs, unsigned int neg_mode,
  2543				       phy_interface_t interface, int speed, int duplex)
  2544	{
  2545		struct airoha_pcs_priv *priv = phylink_pcs_to_airoha_pcs_port(pcs);
  2546	
  2547		if (neg_mode == PHYLINK_PCS_NEG_INBAND_ENABLED) {
  2548			if (interface == PHY_INTERFACE_MODE_SGMII) {
  2549				regmap_update_bits(priv->hsgmii_rate_adp,
  2550						   AIROHA_PCS_HSGMII_RATE_ADAPT_CTRL_1,
  2551						   AIROHA_PCS_HSGMII_RATE_ADAPT_RX_AFIFO_WR_THR |
  2552						   AIROHA_PCS_HSGMII_RATE_ADAPT_RX_AFIFO_RD_THR,
  2553						   FIELD_PREP(AIROHA_PCS_HSGMII_RATE_ADAPT_RX_AFIFO_WR_THR, 0x0) |
  2554						   FIELD_PREP(AIROHA_PCS_HSGMII_RATE_ADAPT_RX_AFIFO_RD_THR, 0x0));
  2555				udelay(1);
  2556				regmap_update_bits(priv->hsgmii_rate_adp,
  2557						   AIROHA_PCS_HSGMII_RATE_ADAPT_CTRL_1,
  2558						   AIROHA_PCS_HSGMII_RATE_ADAPT_RX_AFIFO_WR_THR |
  2559						   AIROHA_PCS_HSGMII_RATE_ADAPT_RX_AFIFO_RD_THR,
  2560						   FIELD_PREP(AIROHA_PCS_HSGMII_RATE_ADAPT_RX_AFIFO_WR_THR, 0xf) |
  2561						   FIELD_PREP(AIROHA_PCS_HSGMII_RATE_ADAPT_RX_AFIFO_RD_THR, 0x5));
  2562			}
  2563		} else {
  2564			if (interface == PHY_INTERFACE_MODE_USXGMII ||
  2565			    interface == PHY_INTERFACE_MODE_10GBASER) {
  2566				u32 mode;
  2567				u32 rate_adapt;
  2568	
  2569				switch (speed) {
  2570				case SPEED_10000:
  2571					rate_adapt = AIROHA_PCS_HSGMII_RATE_ADPT_FORCE_RATE_ADAPT_MODE_10000;
  2572					mode = AIROHA_PCS_USXGMII_MODE_10000;
  2573					break;
  2574				case SPEED_5000:
  2575					rate_adapt = AIROHA_PCS_HSGMII_RATE_ADPT_FORCE_RATE_ADAPT_MODE_5000;
  2576					mode = AIROHA_PCS_USXGMII_MODE_5000;
  2577					break;
  2578				case SPEED_2500:
  2579					rate_adapt = AIROHA_PCS_HSGMII_RATE_ADPT_FORCE_RATE_ADAPT_MODE_2500;
  2580					mode = AIROHA_PCS_USXGMII_MODE_2500;
  2581					break;
  2582				case SPEED_1000:
  2583					rate_adapt = AIROHA_PCS_HSGMII_RATE_ADPT_FORCE_RATE_ADAPT_MODE_1000;
  2584					mode = AIROHA_PCS_USXGMII_MODE_1000;
  2585					break;
  2586				case SPEED_100:
  2587					rate_adapt = AIROHA_PCS_HSGMII_RATE_ADPT_FORCE_RATE_ADAPT_MODE_100;
  2588					mode = AIROHA_PCS_USXGMII_MODE_100;
  2589					break;
  2590				}
  2591	
  2592				/* Trigger USXGMII change mode and force selected speed */
  2593				regmap_update_bits(priv->usxgmii_pcs, AIROHA_PCS_USXGMII_PCS_AN_CONTROL_7,
  2594						   AIROHA_PCS_USXGMII_RATE_UPDATE_MODE |
  2595						   AIROHA_PCS_USXGMII_MODE,
  2596						   AIROHA_PCS_USXGMII_RATE_UPDATE_MODE | mode);
  2597	
  2598				regmap_update_bits(priv->hsgmii_rate_adp, AIROHA_PCS_HSGMII_RATE_ADAPT_CTRL_11,
  2599						   AIROHA_PCS_HSGMII_RATE_ADPT_FORCE_RATE_ADAPT_MODE_EN |
  2600						   AIROHA_PCS_HSGMII_RATE_ADPT_FORCE_RATE_ADAPT_MODE,
  2601						   AIROHA_PCS_HSGMII_RATE_ADPT_FORCE_RATE_ADAPT_MODE_EN |
  2602						   rate_adapt);
  2603			}
  2604	
  2605			if (interface == PHY_INTERFACE_MODE_SGMII ||
  2606			    interface == PHY_INTERFACE_MODE_1000BASEX) {
  2607				u32 force_speed;
  2608				u32 rate_adapt;
  2609	
  2610				switch (speed) {
  2611				case SPEED_1000:
  2612					force_speed = AIROHA_PCS_HSGMII_PCS_SGMII_SPD_FORCE_1000;
  2613					rate_adapt = AIROHA_PCS_HSGMII_PCS_FORCE_RATEADAPT_VAL_1000;
  2614					break;
  2615				case SPEED_100:
  2616					force_speed = AIROHA_PCS_HSGMII_PCS_SGMII_SPD_FORCE_100;
  2617					rate_adapt = AIROHA_PCS_HSGMII_PCS_FORCE_RATEADAPT_VAL_100;
  2618					break;
  2619				case SPEED_10:
  2620					force_speed = AIROHA_PCS_HSGMII_PCS_SGMII_SPD_FORCE_10;
  2621					rate_adapt = AIROHA_PCS_HSGMII_PCS_FORCE_RATEADAPT_VAL_10;
  2622					break;
  2623				}
  2624	
  2625				regmap_update_bits(priv->hsgmii_pcs, AIROHA_PCS_HSGMII_PCS_CTROL_6,
  2626						   AIROHA_PCS_HSGMII_PCS_SGMII_SPD_FORCE_10 |
  2627						   AIROHA_PCS_HSGMII_PCS_SGMII_SPD_FORCE_100 |
  2628						   AIROHA_PCS_HSGMII_PCS_SGMII_SPD_FORCE_1000 |
  2629						   AIROHA_PCS_HSGMII_PCS_FORCE_RATEADAPT_VAL,
> 2630						   force_speed | rate_adapt);
  2631			}
  2632	
  2633			if (interface == PHY_INTERFACE_MODE_SGMII ||
  2634			    interface == PHY_INTERFACE_MODE_2500BASEX) {
  2635				u32 ck_gen_mode;
  2636				u32 speed_reg;
  2637				u32 if_mode;
  2638	
  2639				switch (speed) {
  2640				case SPEED_2500:
  2641					speed_reg = AIROHA_PCS_LINK_MODE_P0_2_5G;
  2642					break;
  2643				case SPEED_1000:
  2644					speed_reg = AIROHA_PCS_LINK_MODE_P0_1G;
  2645					if_mode = AIROHA_PCS_HSGMII_AN_SPEED_FORCE_MODE_1000;
  2646					ck_gen_mode = AIROHA_PCS_HSGMII_PCS_FORCE_CUR_SGMII_MODE_1000;
  2647					break;
  2648				case SPEED_100:
  2649					speed_reg = AIROHA_PCS_LINK_MODE_P0_100M;
  2650					if_mode = AIROHA_PCS_HSGMII_AN_SPEED_FORCE_MODE_100;
  2651					ck_gen_mode = AIROHA_PCS_HSGMII_PCS_FORCE_CUR_SGMII_MODE_100;
  2652					break;
  2653				case SPEED_10:
  2654					speed_reg = AIROHA_PCS_LINK_MODE_P0_100M;
  2655					if_mode = AIROHA_PCS_HSGMII_AN_SPEED_FORCE_MODE_10;
  2656					ck_gen_mode = AIROHA_PCS_HSGMII_PCS_FORCE_CUR_SGMII_MODE_10;
  2657					break;
  2658				}
  2659	
  2660				if (interface == PHY_INTERFACE_MODE_SGMII) {
  2661					regmap_update_bits(priv->hsgmii_an, AIROHA_PCS_HSGMII_AN_SGMII_REG_AN_13,
  2662							   AIROHA_PCS_HSGMII_AN_SPEED_FORCE_MODE,
> 2663							   if_mode);
  2664	
  2665					regmap_update_bits(priv->hsgmii_pcs, AIROHA_PCS_HSGMII_PCS_AN_SGMII_MODE_FORCE,
  2666							   AIROHA_PCS_HSGMII_PCS_FORCE_CUR_SGMII_MODE |
  2667							   AIROHA_PCS_HSGMII_PCS_FORCE_CUR_SGMII_MODE_SEL,
> 2668							   ck_gen_mode |
  2669							   AIROHA_PCS_HSGMII_PCS_FORCE_CUR_SGMII_MODE_SEL);
  2670				}
  2671	
  2672				regmap_update_bits(priv->multi_sgmii, AIROHA_PCS_MULTI_SGMII_SGMII_STS_CTRL_0,
  2673						   AIROHA_PCS_LINK_MODE_P0 |
  2674						   AIROHA_PCS_FORCE_SPD_MODE_P0,
> 2675						   speed_reg |
  2676						   AIROHA_PCS_FORCE_SPD_MODE_P0);
  2677			}
  2678		}
  2679	
  2680		/* Reset TXPCS on link up */
  2681		regmap_clear_bits(priv->xfi_pma, AIROHA_PCS_PMA_SW_RST_SET,
  2682				  AIROHA_PCS_PMA_SW_HSG_TXPCS_RST_N);
  2683	
  2684		usleep_range(100, 200);
  2685	
  2686		regmap_set_bits(priv->xfi_pma, AIROHA_PCS_PMA_SW_RST_SET,
  2687				AIROHA_PCS_PMA_SW_HSG_TXPCS_RST_N);
  2688	}
  2689	
  2690	static const struct phylink_pcs_ops airoha_pcs_ops = {
  2691		.pcs_get_state = airoha_pcs_get_state,
  2692		.pcs_config = airoha_pcs_config,
  2693		.pcs_an_restart = airoha_pcs_an_restart,
  2694		.pcs_link_up = airoha_pcs_link_up,
  2695	};
  2696	
  2697	static const struct regmap_config airoha_pcs_regmap_config = {
  2698		.reg_bits = 32,
  2699		.val_bits = 32,
  2700		.reg_stride = 4,
  2701	};
  2702	
  2703	static int airoha_pcs_probe(struct platform_device *pdev)
  2704	{
  2705		struct regmap_config syscon_config = airoha_pcs_regmap_config;
  2706		struct device *dev = &pdev->dev;
  2707		struct airoha_pcs_priv *priv;
  2708		void __iomem *base;
  2709		int ret;
  2710	
  2711		priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
  2712		if (!priv)
  2713			return -ENOMEM;
  2714	
  2715		priv->dev = dev;
  2716		priv->data = of_device_get_match_data(dev);
  2717	
  2718		base = devm_platform_ioremap_resource_byname(pdev, "xfi_mac");
  2719		if (IS_ERR(base))
  2720			return PTR_ERR(base);
  2721	
  2722		syscon_config.name = "xfi_mac";
  2723		priv->xfi_mac = devm_regmap_init_mmio(dev, base, &syscon_config);
  2724		if (IS_ERR(priv->xfi_mac))
  2725			return PTR_ERR(priv->xfi_mac);
  2726	
  2727		base = devm_platform_ioremap_resource_byname(pdev, "hsgmii_an");
  2728		if (IS_ERR(base))
  2729			return PTR_ERR(base);
  2730	
  2731		syscon_config.name = "hsgmii_an";
  2732		priv->hsgmii_an = devm_regmap_init_mmio(dev, base, &syscon_config);
  2733		if (IS_ERR(priv->hsgmii_an))
  2734			return PTR_ERR(priv->hsgmii_an);
  2735	
  2736		base = devm_platform_ioremap_resource_byname(pdev, "hsgmii_pcs");
  2737		if (IS_ERR(base))
  2738			return PTR_ERR(base);
  2739	
  2740		syscon_config.name = "hsgmii_pcs";
  2741		priv->hsgmii_pcs = devm_regmap_init_mmio(dev, base, &syscon_config);
  2742		if (IS_ERR(priv->hsgmii_pcs))
  2743			return PTR_ERR(priv->hsgmii_pcs);
  2744	
  2745		base = devm_platform_ioremap_resource_byname(pdev, "hsgmii_rate_adp");
  2746		if (IS_ERR(base))
  2747			return PTR_ERR(base);
  2748	
  2749		syscon_config.name = "hsgmii_rate_adp";
  2750		priv->hsgmii_rate_adp = devm_regmap_init_mmio(dev, base, &syscon_config);
  2751		if (IS_ERR(priv->hsgmii_rate_adp))
  2752			return PTR_ERR(priv->hsgmii_rate_adp);
  2753	
  2754		base = devm_platform_ioremap_resource_byname(pdev, "multi_sgmii");
  2755		if (IS_ERR(base))
  2756			return PTR_ERR(base);
  2757	
  2758		syscon_config.name = "multi_sgmii";
  2759		priv->multi_sgmii = devm_regmap_init_mmio(dev, base, &syscon_config);
  2760		if (IS_ERR(priv->multi_sgmii))
  2761			return PTR_ERR(priv->multi_sgmii);
  2762	
  2763		base = devm_platform_ioremap_resource_byname(pdev, "usxgmii");
  2764		if (IS_ERR(base) && PTR_ERR(base) != -ENOENT)
  2765			return PTR_ERR(base);
  2766	
  2767		syscon_config.name = "usxgmii";
  2768		priv->usxgmii_pcs = devm_regmap_init_mmio(dev, base, &syscon_config);
  2769		if (IS_ERR(priv->usxgmii_pcs))
  2770			return PTR_ERR(priv->usxgmii_pcs);
  2771	
  2772		base = devm_platform_ioremap_resource_byname(pdev, "xfi_pma");
  2773		if (IS_ERR(base) && PTR_ERR(base) != -ENOENT)
  2774			return PTR_ERR(base);
  2775	
  2776		syscon_config.name = "xfi_pma";
  2777		priv->xfi_pma = devm_regmap_init_mmio(dev, base, &syscon_config);
  2778		if (IS_ERR(priv->xfi_pma))
  2779			return PTR_ERR(priv->xfi_pma);
  2780	
  2781		base = devm_platform_ioremap_resource_byname(pdev, "xfi_ana");
  2782		if (IS_ERR(base) && PTR_ERR(base) != -ENOENT)
  2783			return PTR_ERR(base);
  2784	
  2785		syscon_config.name = "xfi_ana";
  2786		priv->xfi_ana = devm_regmap_init_mmio(dev, base, &syscon_config);
  2787		if (IS_ERR(priv->xfi_ana))
  2788			return PTR_ERR(priv->xfi_ana);
  2789	
  2790		/* SCU is used to toggle XFI or HSGMII in global SoC registers */
  2791		priv->scu = syscon_regmap_lookup_by_compatible("airoha,en7581-scu");
  2792		if (IS_ERR(priv->scu))
  2793			return PTR_ERR(priv->scu);
  2794	
  2795		priv->rsts[0].id = "mac";
  2796		priv->rsts[1].id = "phy";
  2797		ret = devm_reset_control_bulk_get_exclusive(dev, ARRAY_SIZE(priv->rsts),
  2798							    priv->rsts);
  2799		if (ret)
  2800			return dev_err_probe(dev, ret, "failed to get bulk reset lines\n");
  2801	
  2802		platform_set_drvdata(pdev, priv);
  2803	
  2804		priv->pcs.ops = &airoha_pcs_ops;
  2805		priv->pcs.poll = true;
  2806	
  2807		__set_bit(PHY_INTERFACE_MODE_SGMII, priv->pcs.supported_interfaces);
  2808		__set_bit(PHY_INTERFACE_MODE_1000BASEX, priv->pcs.supported_interfaces);
  2809		__set_bit(PHY_INTERFACE_MODE_2500BASEX, priv->pcs.supported_interfaces);
  2810		__set_bit(PHY_INTERFACE_MODE_10GBASER, priv->pcs.supported_interfaces);
  2811		__set_bit(PHY_INTERFACE_MODE_USXGMII, priv->pcs.supported_interfaces);
  2812	
  2813		return fwnode_pcs_add_provider(dev_fwnode(dev), fwnode_pcs_simple_get,
  2814					   &priv->pcs);
  2815	}
  2816	
  2817	static void airoha_pcs_remove(struct platform_device *pdev)
  2818	{
  2819		struct airoha_pcs_priv *priv = platform_get_drvdata(pdev);
  2820	
  2821		fwnode_pcs_del_provider(dev_fwnode(&pdev->dev));
  2822	
  2823		rtnl_lock();
> 2824		phylink_release_pcs(&priv->pcs);
  2825		rtnl_unlock();
  2826	}
  2827	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
